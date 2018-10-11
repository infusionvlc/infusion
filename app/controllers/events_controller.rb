# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[destroy]

  include MarkdownConcern

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    if @event.save
      ok_status
    else
      error_status
    end
  end

  def index
    @events = Event.where('date >= ?', Date.today)
                   .order(date: :asc).page(params[:page])
    authorize @events
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:date)
  end

  def set_event
    @event = Event.find(params[:id])
  rescue StandardError
    redirect_to events_path
  end

  def ok_status
    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { render :show, status: :created, event: @event }
    end
  end

  def error_status
    format.html { render :new }
    format.json { render json: @event.errors, status: :unprocessable_entity }
  end
end
