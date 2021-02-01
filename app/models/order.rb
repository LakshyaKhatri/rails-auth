class Order < ApplicationRecord
  has_many :order_items

  validates :cart, presence: true, uniqueness: { message: 'Order already present for this cart' }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
