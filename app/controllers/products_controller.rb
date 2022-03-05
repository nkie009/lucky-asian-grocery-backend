class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]



  def new
    @product = Product.new
  end

  def create
    Product.create product_params
    @product = Product.new product_params

    if params[:product][:image].present?
      # Forward the uploaded image on to Cloudinary (using the gem):
      response = Cloudinary::Uploader.upload params[:product][:image]
      p response  # so we can see what the response looks like
      @product.image = response["public_id"] # add to the item we are saving
    end  # upload check
    # @product.user_id = @current_user.id
    @product.save
    # to do :checkvalidation and show errors on form (mixtapes controller)
   
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product.to_json }
    end
    
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @product.update product_params
    if params[:product][:image].present?
      response = Cloudinary::Uploader.upload params[:product][:image]
      p response
      @product.image = response["public_id"]
      @product.save
    end
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
    params.require(:product).permit(:name, :price, :description, :category_id, :image, :stock )
  end # of private

end#of class

