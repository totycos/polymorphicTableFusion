class CompanyProduct < ApplicationRecord
  belongs_to :company
  belongs_to :product
  belongs_to :category
end
