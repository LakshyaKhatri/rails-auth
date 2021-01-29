class Order < ApplicationRecord
  has_one :cart
  has_many :order_items
  has_many :items, through: :order_items
end
