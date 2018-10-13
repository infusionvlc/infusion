# frozen_string_literal: true

class MeetupsController < ApplicationController
  before_action :set_meetup, only: %i[show edit update destroy leave]

  include MarkdownConcern

  # GET /meetups
  # GET /meetups.json
  def index
    @next_sessions = Event.where('events.date >= ?', Date.today)
                          .order('date ASC').first&.sessions

    @most_recent = Meetup.active.joins(:events).where('events.date < ?', Date.today)
                         .order('date DESC').first(3)
    @most_popular = Meetup.active.joins(:events).where('events.date < ?', Date.today)
                          .joins("LEFT OUTER JOIN sessions AS meetup_sessions ON " +
                                 "meetup_sessions.meetup_id = meetups.id LEFT OUTER JOIN " +
                                 "assistances ON assistances.session_id = meetup_sessions.id")
                          .group(:id)
                          .order('COUNT(assistances.id) DESC').first(3)
  end

  # GET /ranking
  # GET /ranking.json
  def ranking
    @meetups = Meetup.active.where(on_ranking: true)
                     .joins("LEFT OUTER JOIN sessions AS meetup_sessions ON " +
                            "meetup_sessions.meetup_id = meetups.id LEFT OUTER JOIN " +
                            "assistances ON assistances.session_id = meetup_sessions.id")
                     .group(:id)
                     .order('COUNT(assistances.id) DESC').page params[:page]
  end

  # GET /archive
  # GET /archive.json
  def archive
    @meetups = Meetup.active.joins(:events).where('events.date < ?', Date.today)
                     .order('events.date DESC').page params[:page]
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
    authorize @meetup
    @video = @meetup.video_url[/=(.*)/][1..-1] if (@meetup.video_url && \
                                                   @meetup.video_url.length.positive?)
    @reviews = @meetup.assistances.where.not(review: nil).order(created_at: :desc)
                      .page(params[:page])
    @reportable_type = 'Meetup'
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
    authorize @meetup
  end

  # GET /meetups/1/edit
  def edit
    authorize @meetup
  end

  # POST /meetups
  # POST /meetups.json
  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.on_ranking = true
    authorize @meetup
    respond_to do |format|
      if @meetup.save
        @activity = @meetup.create_activity(current_user.id)
        @notifications = @activity.create_notification
        @meetup.holdings.create(user_id: current_user.id)
        create_session
        notify_collaborators
        format.html { redirect_to meetup_path(@meetup) }
        format.json do
          render :show, status: :created, location: @meetup
        end
      else
        format.html { render :new }
        format.json do
          render json: @meetup.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /meetups/1
  # PATCH/PUT /meetups/1.json
  def update
    authorize @meetup
    respond_to do |format|
      if @meetup.update(meetup_params)
        notify_collaborators
        format.html { redirect_to meetup_path(@meetup) }
        format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit }
        format.json do
          render json: @meetup.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /meetups/1
  # DELETE /meetups/1.json
  def destroy
    authorize @meetup
    @meetup.destroy
    redirect_to(meetups_path)
  end

  # POST /meetups/1//leave
  def leave
    authorize @meetup
    @meetup.holdings.where(user_id: current_user.id).first.destroy
    @meetup.holdings.each do |host|
    MeetupMailer.notify_abandon(@meetup, host.user, current_user).deliver
    end
    redirect_to(meetup_path(@meetup), alert: I18n.t('main.abandon'))
  end

  private

  def create_session
    return unless Location.where(active: true).first
    @meetup.sessions.create(
      location_id: Location.where(active: true).first.id
    )
  end

  def notify_collaborators
    @meetup.holdings.each do |host|
      if host.user != current_user
        MeetupMailer.notify_collaboration(@meetup, host.user).deliver
      end
    end
  end

  def set_meetup
    @meetup = Meetup.find(params[:id])
  rescue StandardError
    redirect_to(meetups_path)
  end

  def meetup_params
    params.require(:meetup).permit(
      :title,
      :description,
      :archived,
      :requirements,
      :video_url,
      :on_ranking,
      holdings_attributes:    [:id, :user_id, :role, :_destroy],
      photos_attributes:      [:id, :file,
                               :attribution, :meetup_id, :_destroy],
      attachments_attributes: [:id, :file, :meetup_id, :_destroy],
      category_ids: []
    )
  end
end
