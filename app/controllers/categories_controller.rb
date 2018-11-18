# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  include MarkdownConcern

  # GET /categories/1
  # GET /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
    authorize @category
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      ok_status
    else
      error_status
    end
  end

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all.page(params[:page])
  end

  # GET /categories/1/edit
  # GET /categories/1/edit.json
  def edit; end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    authorize @category
    @category.destroy
    redirect_to categories_path
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    authorize @category
    if @category.update(category_params)
      ok_status
    else
      error_status
    end
  end

  private

  # Parameters whitelist for categories
  def category_params
    params.require(:category).permit(:name, :ca_name, :es_name)
  end

  # Find current Category object
  def set_category
    @category = Category.find(params[:id])
  rescue StandardError
    redirect_to_path(categories_path)
  end

  # Defines the desired behaviour after a successful operation
  def ok_status
    respond_to do |format|
      format.html { redirect_to categories_path }
      format.json { render :show, status: :created, location: @category }
    end
  end

  # Defines the desired behaviour after a failed operation
  def error_status
    format.html { render :edit }
    format.json { render json: @category.errors, status: :unprocessable_entity }
  end
end
