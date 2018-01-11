class AssistancesController < ApplicationController
    before_action :set_assistance, only: %i[show edit update destroy]

    def show; end

    def new
      @assistance = Assistance.new
    end

    def create
      @assistance = Assistance.new(assistance_params)
      if @assistance.save
        MeetupMailer.subscribed_to(@assistance.meetup, current_user).deliver
        ok_status
      else
        error_status
      end
    end

    def index
      @assistances = Assistance.all
    end

    def edit
      @meetup = @assistance.meetup
    end

    def destroy
      @meetup = @assistance.meetup
      @assistance.destroy
      redirect_to meetup_path @meetup
    end

    def update
      if @assistance.update(assistance_params)
        ok_status
      else
        error_status
      end
    end

    private

    def assistance_params
      params.require(:assistance).permit(:user_id, :meetup_id, :mark, :review)
    end

    def set_assistance
      @assistance = Assistance.find(params[:id])
    rescue StandardError
      redirect_to_path(assistances_path)
    end

    def ok_status
      @meetup = @assistance.meetup
      respond_to do |format|
        format.html { redirect_to meetup_path @meetup }
        format.json { render :show, status: :created, location: @assistance }
      end
    end

    def error_status
      format.html { render :edit }
      format.json { render json: @assistance.errors, status: :unprocessable_entity }
    end
  end
