# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[destroy]

  include MarkdownConcern

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize @event
    if @event.save
      ok_status
    else
      error_status
    end
  end

  # GET /events
  def index
    @events = Event.where('date >= ?', Date.today)
                   .order(date: :asc).page(params[:page])
    authorize @events
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize @event
    @event.destroy
    redirect_to events_path
  end

  private

  # Parameters whitelist for events
  def event_params
    params.require(:event).permit(:date)
  end

  # Find current Event object
  def set_event
    @event = Event.find(params[:id])
  rescue StandardError
    redirect_to events_path
  end

  # Defines the desired behaviour after a successful operation
  def ok_status
    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { render :show, status: :created, event: @event }
    end
  end

  # Defines the desired behaviour after a failed operation
  def error_status
    format.html { render :new }
    format.json { render json: @event.errors, status: :unprocessable_entity }
  end
end
