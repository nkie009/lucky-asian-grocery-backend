class AddProductIdToOrderLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_line_items, :product_id, :integer
  end
end
