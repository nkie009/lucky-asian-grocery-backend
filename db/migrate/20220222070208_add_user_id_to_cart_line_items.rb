class AddUserIdToCartLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_line_items, :user_id, :integer
  end
end
