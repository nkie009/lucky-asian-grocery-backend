class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def new
    @category = Category.new
  end

  def create
    Category.create category_params
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @category.to_json }
    end
    
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    @category.update category_params
    redirect_to category_path(params[:id])
  end

  def destroy
    Category.destroy params[:id]
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'category deleted.' }
      format.json { head :no_content }
    end
  
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end # of private

end#of class
