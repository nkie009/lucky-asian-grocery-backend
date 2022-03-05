class User < ApplicationRecord
    has_secure_password
    has_many :cart_line_items
    has_many :order_line_items
    has_many :orders
    has_many :products

end
