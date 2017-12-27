class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def new
    puts("neuvo")
    @category = Category.new
  end
 
  def create
    puts("crear")
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
