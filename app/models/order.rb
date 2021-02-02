class Order < ApplicationRecord
  has_many :order_items
  belongs_to :cart, optional: true

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Make it a transaction
  def create_order_items
    self.cart.cart_items.find_each do |cart_item|
      item = cart_item.item
      @order_item = OrderItem.new(
        item: item,
        qty: cart_item.qty,
        price: item.taxed_price,
        order: self,
      )

      @order_item.save
    end
  end
end
