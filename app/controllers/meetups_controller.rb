class MeetupsController < ApplicationController
  before_action :set_meetup, only: %i[show edit update destroy vote]

  # GET /meetups
  # GET /meetups.json
  def index
    @meetups = Meetup.all.where(date: :not_null)
  end

  # GET /call_for_talks
  # GET /call_for_talks.json
  def call_for_talks
    @meetups = Meetup.where(date: nil).left_joins(:assistances).group(:id).order('COUNT(assistances.id) DESC')
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
    authorize @meetup
    @reviews = @meetup.assistances.where.not(review: nil)
  end

  # POST /meetups/1/vote
  # POST /meetups/1/vote.json
  def vote
    authorize @meetup
    @meetup.assistances.create(user_id: current_user.id)
    redirect_back(fallback_location: meetup_path(@meetup), alert: 'Tu voto ha sido registrado')
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
    respond_to do |format|
      if @meetup.save
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
