class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  scope :with_availability, -> { select("order_items.*, (SELECT item.qty >= order_items.qty) as available") }
end
