class Category < ApplicationRecord
  has_many :company_products
  has_many :user_products
end
