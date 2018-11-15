# frozen_string_literal: true

class MeetupSessionsController < ApplicationController
  before_action :set_meetup_session, only: %i[vote unvote confirm delay]

  # POST /meetups/1/sessions/1/vote
  def vote
    authorize @meetup
    MeetupMailer.subscribed_to(@meetup, current_user).deliver
    @session.assistances.create(user_id: current_user.id)
    redirect_back(fallback_location: meetup_path(@meetup),
                  alert: I18n.t('main.saved_vote'))
  end

  # POST /meetups/1/sessions/1/unvote
  def unvote
    authorize @meetup
    @session.assistances.where(user_id: current_user.id).first.destroy
    redirect_back(fallback_location: meetup_path(@meetup),
                  alert: I18n.t('main.deleted_vote'))
  end

  # POST /meetups/1/sessions/1/confirm
  def confirm
    authorize @meetup
    @session.event = Event.where('events.date >= ?', Date.today)
                          .order('date ASC').first
    @session.update(start: Time.parse('16:00'), end: Time.parse('18:00'))
    @meetup.update(confirmation_mail: false, on_ranking: false)
    @session.assistances.each do |assistance|
      MeetupMailer.notify_publication(@meetup, assistance.user).deliver
    end
    redirect_to @meetup, alert: I18n.t('main.confirmed')
  end

  # POST /meetups/1/sessions/1/delay
  def delay
    authorize @meetup
    @meetup.update(confirmation_mail: false)
    next_meetup = Session.where(event_id: nil).where
                         .not(meetup_id: @meetup.id).left_joins(:assistances).group(:id).having('COUNT(assistances.id) <= ?', @session.assistances.count).order('COUNT(assistances.id) DESC').first
    MeetupMailer.ask_for_confirmation(next_meetup,
                 next_meetup.holdings.first.user).deliver
    next_meetup.update(confirmation_mail: true)
    redirect_to @meetup, alert: I18n.t('main.delayed')
  end

  private

  # Find current Meetup Session object
  def set_meetup_session
    @meetup = Meetup.find(params[:meetup_id])
    @session = Session.find(params[:id])
  rescue StandardError
    redirect_to(meetups_path)
  end

  # Parameters whitelist for meetups sessions
  def meetup_params
    params.require(:session).permit(
      :date,
      :start,
      :end,
      :location_id,
      :video_url
    )
  end
end
