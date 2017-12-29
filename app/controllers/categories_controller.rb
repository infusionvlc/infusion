class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html {redirect_to categories_path}
        format.json {render :show, status: :created, location: @category}
      end
    else
      format.html {render :new }
      format.json {render json: @category.errors, status: :unprocessable_entity}
    end
  end

  def index
    @categories = Category.all
  end

  def edit
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.html {redirect_to categories_path}
        format.json {render :show, status: :ok, location: @category}
      end
    else
      format.html {render :edit}
      format.json {render json: @category.errors, status: :unprocessable_entity}
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  rescue
    redirect_to_path(categories_path)
  end
end
