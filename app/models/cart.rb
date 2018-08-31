class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user_order, optional: true
end
