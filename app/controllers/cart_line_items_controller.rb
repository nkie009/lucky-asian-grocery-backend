class CartLineItemsController < ApplicationController

 
  def index
    
  end

  def add 
    @cartlineitem = CartLineItem.create product_id: params[:product_id], qty: 1, user_id: current_user.id 
    
  end
  

  def update_qty
    @cartlineitem = CartLineItem.find_by(product_id: params[:product_id])
    @cartlineitem.update qty: params[:qty]

    
  end
  
  
  def destroy
    @cartlineitem = CartLineItem.find_by(product_id: params[:product_id])
    @cartlineitem.destroy

    
  end

  private
  def cart_line_items_params
    params.require(:cart_line_items).permit(:product_id, :user_id, :qty)
  end

end
