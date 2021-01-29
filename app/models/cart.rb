class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items
  has_one :order


  private
  def empty_cart
    CartItem.where(cart:self).delete_all
  end
end
