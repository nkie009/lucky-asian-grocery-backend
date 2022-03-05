class Product < ApplicationRecord
    belongs_to :category, optional: true
    has_many :reviews
    has_many :cart_line_items
    belongs_to :user, optional: true

end
