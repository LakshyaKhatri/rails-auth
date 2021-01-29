class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :qty, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validate :cart_exists
  validate :item_exists
  validates :item, uniqueness: { scope: :cart, message: "already exists in cart" }

  def item_exists
    unless Item.find_by(id: self.item_id).present?
      errors.add(:item_id, "Item doesn't exists")
    end
  end

  def cart_exists
    unless Cart.find_by(id: self.cart_id).present?
      errors.add(:cart_id, "Cart doesn't exists")
    end
  end
end
