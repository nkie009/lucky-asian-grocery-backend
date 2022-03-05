class AddCartLineItemIdToOrderLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_line_items, :cart_line_item_id, :integer
  end
end
