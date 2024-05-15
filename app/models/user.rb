class User < ApplicationRecord
  has_many :user_products
  has_many :investments, as: :investor
end
