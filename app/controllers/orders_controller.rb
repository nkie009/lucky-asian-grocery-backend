class OrdersController < ApplicationController

  before_action :authenticate_user

  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find params[:id]
    render json: @order, include: :order_line_items
    
  end

  def create
    order = Order.create user_id:current_user.id, address:params[:address], status: :unpaid #name and payment type migration required 
    if order.persisted?
      current_user.cart_line_items.each do |cart_item|

        #create order line item fields from line item
        order_item = OrderLineItem.create order_id: order.id, qty: cart_item.qty, product_id: cart_item.product_id

        #TODO:can delete cart_line_items for user after the status has been changed to paid
      end #end of each

    end 

    # STRIPE: And once the fake cc credit ards details are taken then we are ready to drop in stripe and then at least the db is working and we can finally implement that.

    render json: order, include: :order_line_items
    #return object that works with
  end
  
  def update
    order = Order.find params[:id]
    if order.update status: :paid
      order.save
      render json: order, include: :order_line_items
    else
      flash[:error] = "No Order Found"
    end
  end

  private 


end

