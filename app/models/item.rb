class Item < ApplicationRecord
  belongs_to :category

  has_many :applied_taxes
  has_many :taxes, through: :applied_taxes

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.1 }
end
