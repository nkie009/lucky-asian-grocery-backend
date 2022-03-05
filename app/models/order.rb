class Order < ApplicationRecord
    belongs_to :user, optional: true
    has_many :order_line_items
    enum status: [:unpaid, :paid]
end
