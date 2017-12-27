class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end 

  def create
    @category = Category.new(category_params)   
    @category.save
    redirect_to @category
  end  

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy 
    redirect_to categories_path
  end

  def update
    @category = Category.find(params[:id])
   
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end 

  private
  def category_params
    params.require(:category).permit(:name)
  end
end