class Cart < ApplicationRecord
  has_many :cart_items, dependent: :delete_all
  has_many :items, through: :cart_items
  has_many :orders, dependent: :nullify

  private
  def empty_cart
    CartItem.where(cart:self).delete_all
  end
end
