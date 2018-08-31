class UserOrder < ApplicationRecord
  has_many :carts
  has_many :products, through: :carts
  belongs_to :delivery_method, optional: true
end
