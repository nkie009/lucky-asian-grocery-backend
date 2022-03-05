class ApiOrderLineItemsController < ApplicationController
  
  before_action :authenticate_user

  def index
    @order_line_items = OrderLineItem.all 
    render json: order_line_items

  end

  def add 
    # TODO :do validation
    @order_line_item = OrderLineItem.create cart_line_item_id: params[:cart_line_item_id], user_id: current_user.id, status: :paid
    render json: @order_line_item
  end
  
  # t.integer "user_id"
  # t.integer "order_id"
  # t.integer "qty"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.integer "cart_line_item_id"
  # t.integer "product_id"
end
