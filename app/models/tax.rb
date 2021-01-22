class Tax < ApplicationRecord
  has_many :applied_taxes
  has_many :items, through: :applied_taxes
end
