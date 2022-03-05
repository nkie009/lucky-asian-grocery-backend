class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.text :name
      t.decimal :price
      t.text :description
      t.text :image
      t.integer :stock
      t.integer :category_id

      t.timestamps
    end
  end
end
