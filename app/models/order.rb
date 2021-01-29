class Order < ApplicationRecord
  belongs_to :cart

  validates :cart, presence: true, uniqueness: true
  validates :total, presence: true, numerically: { greater_than_or_equal_to: 1 }
end
