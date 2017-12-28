class MeetupsController < ApplicationController

  before_action :set_meetup, only: %i[show edit update destroy vote]

  # GET /meetups
  # GET /meetups.json
  def index
    @meetups = Meetup.all.where(date: :not_null)
  end

  # GET /meetups/1
  # GET /meetups/1.json
  def show
    authorize @meetup
  end

  # POST /meetups/1/vote
  # POST /meetups/1/vote.json
  def vote
    authorize @meetup
    @meetup.assistances.create(user_id: current_user.id)
    redirect_to(meetup_path(@meetup))
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
        if params[:holdings]
          params[:holdings].each do |id|
            @meetup.holdings.create(user_id: id)
          end
        end
        if params[:attachments]
          params[:attachments].each do |f|
            @meetup.attachments.create(file: f)
          end
        end
        if params[:photos]
          params[:photos].each do |f|
            @meetup.photos.create(file: f)
          end
        end
        format.html { redirect_to meetup_path(@meetup) }
        format.json { render :show, status: :created, location: @moment }
      else
        format.html { render :new }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetups/1
  # PATCH/PUT /meetups/1.json
  def update
    authorize @meetup

    respond_to do |format|

        if params[:holdings]
          params[:holdings].each do |id|
            @meetup.holdings.where(user_id: id).first_or_create
          end
        end
        if params[:attachments]
          params[:attachments].each do |f|
            @meetup.attachments.where(file: f).first_or_create
          end
        end
        if params[:photos]
          params[:photos].each do |f|
            @meetup.photos.where(file: f).first_or_create
          end
        end

      if @meetup.update(meetup_params)
        format.html { redirect_to meetup_path(@meetup) }
        format.json { render :show, status: :ok, location: @meetup }
      else
        format.html { render :edit }
        format.json { render json: @meetup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetups/1
  # DELETE /meetups/1.json
  def destroy
    authorize @meetup
    @meetup.destroy
    redirect_to_path(meetups_path)
  end

  private

  def set_meetup
    @meetup = Meetup.find(params[:id])
  rescue
    redirect_to_path(meetups_path)
  end

  def meetup_params
    params.require(:meetup).permit(
      :title, :description, :requirements, :date, :start, :end, :attachments, :holdings, :photos
    )
  end

end
