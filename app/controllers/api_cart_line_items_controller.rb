class ApiCartLineItemsController < ApplicationController

  before_action :authenticate_user

  def index
    # @product = []
    # current_user.cart_line_items.each do | i |
    #    @product.push i.product
    #     # puts i.product.image
    # end

    # puts "****&&&&&", @product

    # render json: current_user.cart_line_items 


    # render json: {product: @product, cart: current_user.cart_line_items}
    render json: current_user.cart_line_items, include: :product
    
    
  end

  def add 
    # TODO :do validation
    @cartlineitem = CartLineItem.create product_id: params[:product_id], qty: 1, user_id: current_user.id 
    render json: @cartlineitem
  end
  

  def update_qty
    # @cartlineitem = CartLineItem.find params[:id]
    item = current_user.cart_line_items.find_by product_id: params[:product_id]
    puts 'LOOK AT THIS', @cartlineitem
    #check if quantity doesnt fall below -1
    if params[:qty] >= 1
      item.update qty: params[:qty]
    else
      flash[:alert] = "Can't go below zero"
    end
    render json: item

    # redirect_to api_cart_path
  end
  
  
  def destroy
    item = current_user.cart_line_items.find_by(product_id: params[:product_id])
    item.destroy
    render json: item

    # redirect_to api_cart_path
  end

  private
  def cart_line_items_params
    params.require(:cart_line_items).permit(:product_id, :user_id, :qty)
  end

end
