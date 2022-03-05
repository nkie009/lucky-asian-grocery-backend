class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.string :first_name
      t.string :last_name
      t.text :email
      t.string :phone
      t.text :address
      t.string :password_digest

      t.timestamps
    end
  end
end
