class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items
  has_one :order

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }


  private
  def empty_cart
    CartItem.where(cart:self).delete_all
  end
end
