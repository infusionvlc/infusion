class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def show; end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      ok_status
    else
      error_status
    end
  end

  def index
    @categories = Category.all.page(params[:page])
  end

  def edit; end

  def destroy
    authorize @category
    @category.destroy
    redirect_to categories_path
  end

  def update
    authorize @category
    if @category.update(category_params)
      ok_status
    else
      error_status
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  rescue StandardError
    redirect_to_path(categories_path)
  end

  def ok_status
    respond_to do |format|
      format.html { redirect_to categories_path }
      format.json { render :show, status: :created, location: @category }
    end
  end

  def error_status
    format.html { render :edit }
    format.json { render json: @category.errors, status: :unprocessable_entity }
  end
end
