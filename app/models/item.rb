class Item < ApplicationRecord
  belongs_to :category, dependent: :restrict_with_error

  has_many :applied_taxes
  has_many :taxes, through: :applied_taxes
end
