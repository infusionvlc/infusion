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
    @category = Category.all
  end
 
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
