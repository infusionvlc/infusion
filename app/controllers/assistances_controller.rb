class AssistancesController < ApplicationController
    before_action :set_assistance, only: %i[show edit update destroy]

    def show; end

    def new
      @assistance = Assistance.new
    end

    def create
      @assistance = Assistance.new(assistance_params)
      if @assistance.save
        ok_status
      else
        error_status
      end
    end

    def index
      @assistances = Assistance.all
    end

    def edit
      @meetup = @assistance.session.meetup
    end

    def destroy
      @meetup = @assistance.session.meetup
      @assistance.destroy
      redirect_to meetup_path @meetup
    end

    def update
      if @assistance.update(assistance_params)
        @activity = @assistance.session.meetup.create_activity(current_user.id)
        @notifications = @activity.create_notification
        ok_status
      else
        error_status
      end
    end

    private

    def assistance_params
      params.require(:assistance).permit(:user_id, :session_id, :mark, :review)
    end

    def set_assistance
      @assistance = Assistance.find(params[:id])
    rescue StandardError
      redirect_to_path(assistances_path)
    end

    def ok_status
      @meetup = @assistance.session.meetup
      respond_to do |format|
        format.html { redirect_to @meetup }
        format.json { render :show, status: :created, location: @assistance }
        format.js   { render 'assistances/updated'}
      end
    end

    def error_status
      @meetup = @assistance.session.meetup
      respond_to do |format|
        format.html { redirect_to @meetup }
        format.json { render json: @assistance.errors, status: :unprocessable_entity }
        format.js   { render 'assistances/not_updated'}
      end
    end
  end
