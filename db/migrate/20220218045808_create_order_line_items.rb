class CreateOrderLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_line_items do |t|
      t.integer :user_id
      t.integer :order_id
      t.integer :qty

      t.timestamps
    end
  end
end
