class OrderLineItemsController < ApplicationController
  

  def index
    @order_line_items = OrderLineItems.all
  end

  
  
end
