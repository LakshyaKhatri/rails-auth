class Order < ApplicationRecord
  has_many :order_items

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
