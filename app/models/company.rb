class Company < ApplicationRecord
  has_many :company_products
  has_many :investments, as: :investor
end
