class MeetupsController < ApplicationController
  before_action :set_meetup, only: %i[show edit update destroy vote confirm delay leave]

  include MarkdownConcern

  # GET /meetups
  # GET /meetups.json
  def index
    @next_meetup = Meetup.where('date >= ?', Date.today).first
    @most_recent = Meetup.where('date < ?', Date.today).order('date DESC')
                         .first(3)
    @most_popular = Meetup.where('date < ?', Date.today)
                          .left_joins(:assistances).group(:id)
                          .order('AVG(assistances.mark) DESC').first(3)
  end

  # GET /call_for_talks
  # GET /call_for_talks.json
  def call_for_talks
    @meetups = Meetup.where(date: nil).left_joins(:assistances).group(:id).order('COUNT(assistances.id) DESC').page params[:page]
  end

  # GET /archive
  # GET /archive.json
  def archive
    @meetups = Meetup.where('date < ?', Date.today).order(:date).page params[:page]
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
    authorize @meetup
    @reviews = @meetup.assistances.where.not(review: nil).order(created_at: :desc).page(params[:page])
    @reportable_type = 'Meetup'
  end

  # POST /meetups/1/vote
  def vote
    authorize @meetup
    MeetupMailer.subscribed_to(@meetup, current_user).deliver
    @meetup.assistances.create(user_id: current_user.id)
    redirect_back(fallback_location: meetup_path(@meetup), alert: I18n.t('main.saved_vote'))
  end

  # POST /meetups/1/leave
  def leave
    authorize @meetup
    @meetup.holdings.where(user_id: current_user.id).first.destroy
    @meetup.holdings.each do |host|
      MeetupMailer.notify_abandon(@meetup, host.user, current_user).deliver
    end
    redirect_to(meetup_path(@meetup), alert: I18n.t('main.abandon'))
  end

  # POST /meetups/1/confirm
  def confirm
    authorize @meetup
    @meetup.update(date: Date.today.monday + 4, confirmation_mail: false)
    @meetup.assistances.each do |assistance|
      MeetupMailer.notify_publication(@meetup, assistance.user).deliver
    end
    redirect_to @meetup, alert: I18n.t('main.confirmed')
  end

  # POST /meetups/1/delay
  def delay
    authorize @meetup
    @meetup.update(confirmation_mail: false)
    next_meetup = Meetup.where(date: nil).where.not(id: @meetup.id).left_joins(:assistances).group(:id).having('COUNT(assistances.id) <= ?', @meetup.assistances.count).order('COUNT(assistances.id) DESC').first
    MeetupMailer.ask_for_confirmation(next_meetup, next_meetup.holdings.first.user).deliver
    next_meetup.update(confirmation_mail: true)
    redirect_to @meetup, alert: I18n.t('main.delayed')
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new
    @location = Location.where(active: true).first
    authorize @meetup
  end

  # GET /meetups/1/edit
  def edit
    @location = Location.where(active: true).first
    authorize @meetup
  end

  # POST /meetups
  # POST /meetups.json
  def create
    @meetup = Meetup.new(meetup_params)
    @location = Location.where(active: true).first
    authorize @meetup
    @meetup.location = @location
    respond_to do |format|
      if @meetup.save
        @activity = @meetup.create_activity(current_user.id)
        @notifications = @activity.create_notification
        @meetup.holdings.create(user_id: current_user.id)
        notify_collaborators
        format.html { redirect_to meetup_path(@meetup) }
        format.json do
          render :show,
                 status: :created, location: @meetup
        end
      else
        format.html { render :new }
        format.json do
          render json: @meetup.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /meetups/1
  # PATCH/PUT /meetups/1.json
  def update
    @location = Location.where(active: true).first
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

  private

  def notify_collaborators
    @meetup.holdings.each do |host|
      MeetupMailer.notify_collaboration(@meetup, host.user).deliver if host.user != current_user
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
      :requirements,
      :date,
      :start,
      :end,
      holdings_attributes:    [:id, :user_id, :role, :_destroy],
      photos_attributes:      [:id, :file,
                               :attribution, :meetup_id, :_destroy],
      attachments_attributes: [:id, :file, :meetup_id, :_destroy],
      category_ids: []
    )
  end
end
