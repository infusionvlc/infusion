class MeetupsController < ApplicationController
  before_action :set_meetup, only: %i[show edit update destroy vote confirm delay]

  # GET /meetups
  # GET /meetups.json
  def index
    @next_meetup = Meetup.where('date > ?', Date.today).first
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
    @reviews = @meetup.assistances.where.not(review: nil).page(params[:page])
    @reportable_type = 'Meetup'
  end

  # POST /meetups/1/vote
  def vote
    authorize @meetup
    MeetupMailer.subscribed_to(@meetup, current_user).deliver
    @meetup.assistances.create(user_id: current_user.id)
    @activity = Activity.new
    @activity.user_id = current_user.id
    @activity.objective_type = 'Assistance'
    @activity.objective_id = @meetup.assistances.last.id.to_i
    @activity.save
    redirect_back(fallback_location: meetup_path(@meetup), alert: 'Tu voto ha sido registrado')
  end

  # POST /meetups/1/confirm
  def confirm
    authorize @meetup
    @meetup.update(date: Date.today.monday + 4, confirmation_mail: false)
    @meetup.assistances.each do |assistance|
      MeetupMailer.notify_publication(@meetup, assistance.user).deliver
    end
    redirect_to @meetup, alert: 'Muchas gracias por confirmar tu asistencia!'
  end

  # POST /meetups/1/delay
  def delay
    authorize @meetup
    @meetup.update(confirmation_mail: false)
    next_meetup = Meetup.where(date: nil).where.not(id: @meetup.id).left_joins(:assistances).group(:id).having('COUNT(assistances.id) <= ?', @meetup.assistances.count).order('COUNT(assistances.id) DESC').first
    MeetupMailer.ask_for_confirmation(next_meetup, next_meetup.holdings.first.user).deliver
    next_meetup.update(confirmation_mail: true)
    redirect_to @meetup, alert: 'Esperamos que a la próxima sí estés disponible!'
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
    authorize @meetup
    @meetup.location = Location.where(active: true).first
    respond_to do |format|
      if @meetup.save
        @activity = Activity.new
        @activity.user_id = current_user.id
        @activity.objective_type = 'Meetup'
        @activity.objective_id = @meetup.id
        @activity.save
        @meetup.holdings.create(user_id: current_user.id)
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
    authorize @meetup
    respond_to do |format|
      if @meetup.update(meetup_params)
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
