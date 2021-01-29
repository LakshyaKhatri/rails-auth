class Order < ApplicationRecord
  belongs_to :cart

  validates :cart, presence: true, uniqueness: { message: 'Order already present for this cart' }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
