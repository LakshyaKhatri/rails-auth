class Item < ApplicationRecord
  belongs_to :category

  has_many :applied_taxes
  has_many :taxes, through: :applied_taxes
end
