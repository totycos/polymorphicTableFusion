class Investment < ApplicationRecord
  belongs_to :investor, polymorphic: true
  belongs_to :product
  belongs_to :category
end
