class Item < ApplicationRecord
  belongs_to :category

  scope :with_cart_item_ids, ->(category) {
      left_outer_joins(:cart_items).where(
      'items.category_id = ?', category
    ).select( "items.*, cart_items.id as cart_item_id" )
  }

  has_many :applied_taxes
  has_many :taxes, through: :applied_taxes
  has_many :cart_items

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.1 }
  validates :in_stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :category_exists

  before_save :calculate_tax

  def category_exists
    unless Category.find_by(id: self.category_id).present?
      errors.add(:category_id, "doesn't exists")
    end
  end

  def calculate_tax
    total_tax_rate = 0.0
    self.taxes.each {|tax| total_tax_rate += tax.rate }

    tax_price = self.price + ((self.price * total_tax_rate) / 100.0)
    self.taxed_price = tax_price
  end
end
