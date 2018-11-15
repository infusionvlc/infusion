# frozen_string_literal: true

class AssistancesController < ApplicationController
    before_action :set_assistance, only: %i[show edit update destroy]

    # GET /meetups/1/asssitances/1
    # GET /meetups/1/asssitances/1.json
    def show; end

    # GET /meetups/1/asssitances/new
    def new
      @assistance = Assistance.new
    end

    # POST /meetups/1/assistances
    # POST /meetups/1/assistances.json
    def create
      @assistance = Assistance.new(assistance_params)
      if @assistance.save
        ok_status
      else
        error_status
      end
    end

    # GET /meetups/1/asssitances
    # GET /meetups/1/asssitances.json
    def index
      @assistances = Assistance.all
    end

    # GET /meetups/1/asssitances/edit
    def edit
      @meetup = @assistance.session.meetup
    end

    # DELETE /meetups/1
    # DELETE /meetups/1.json
    def destroy
      @meetup = @assistance.session.meetup
      @assistance.destroy
      redirect_to meetup_path @meetup
    end

    # PATCH/PUT /meetups/1/asssitances/1
    # PATCH/PUT /meetups/1/asssitances/1.json
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

    # Parameters whitelist for assistances
    def assistance_params
      params.require(:assistance).permit(:user_id, :session_id, :mark, :review)
    end

    # Find current Assistance object
    def set_assistance
      @assistance = Assistance.find(params[:id])
    rescue StandardError
      redirect_to_path(assistances_path)
    end

    # Defines the desired behaviour after a successful operation
    def ok_status
      @meetup = @assistance.session.meetup
      respond_to do |format|
        format.html { redirect_to @meetup }
        format.json { render :show, status: :created, location: @assistance }
        format.js   { render 'assistances/updated'}
      end
    end

    # Defines the desired behaviour after a failed operation
    def error_status
      @meetup = @assistance.session.meetup
      respond_to do |format|
        format.html { redirect_to @meetup }
        format.json { render json: @assistance.errors, status: :unprocessable_entity }
        format.js   { render 'assistances/not_updated'}
      end
    end
  end
