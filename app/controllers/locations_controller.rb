# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_location, only: %i[show edit update destroy]

  include MarkdownConcern

  def show; end

  # GET /locations/new
  def new
    @location = Location.new
    authorize @location
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    authorize @location
    if @location.save
      check_active_locations
      ok_status
    else
      error_status
    end
  end

  # GET /locations
  def index
    @locations = Location.all.page(params[:page])
  end

  # GET /locations/1/edit
  def edit; end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    authorize @location
    @location.destroy
    redirect_to location_path
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    authorize @location
    if @location.update(location_params)
      check_active_locations
      ok_status
    else
      error_status
    end
  end

  private

  # Parameters whitelist for locations
  def location_params
    params.require(:location).permit(:name, :active)
  end

  # Find current Location object
  def set_location
    @location = Location.find(params[:id])
  rescue StandardError
    redirect_to_path(locations_path)
  end

  # Defines the desired behaviour after a successful operation
  def ok_status
    respond_to do |format|
      format.html { redirect_to locations_path }
      format.json { render :show, status: :created, location: @location }
    end
  end

  # Defines the desired behaviour after a failed operation
  def error_status
    format.html { render :edit }
    format.json { render json: @location.errors, status: :unprocessable_entity }
  end

  # Sets as inactive all previous locations than the new selected one
  def check_active_locations
    @previous = Location.where(active: true).where.not(id: @location.id).first
    @previous.update(active: false) if @location.active && @previous
  end
end
