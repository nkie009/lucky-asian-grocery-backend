class CreateCartLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_line_items do |t|
      t.integer :product_id
      t.integer :qty

      t.timestamps
    end
  end
end
