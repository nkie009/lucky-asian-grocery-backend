class ApiProductsController < ApplicationController
  
  before_action :authenticate_user, only:[:create, :edit, :updated, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    Product.create product_params
    @user = User.create user_params
    if params[:product][:image].present?
      # Forward the uploaded avatar on to Cloudinary (using the gem):
      response = Cloudinary::Uploader.upload params[:product][:image]
      p response  # so we can see what the response looks like
      @product.image = response["public_id"]
      redirect_to products_path
    end
    
  end

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find params[:id]
    render json: @product
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @product.update product_params
    redirect_to product_path(params[:id])
  end

  def destroy
    Product.destroy params[:id]
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product deleted.' }
      format.json { head :no_content }
    end
  
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :stock )
  end # of private

end#of class
