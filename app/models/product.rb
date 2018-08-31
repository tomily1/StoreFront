class Product < ApplicationRecord
  has_many :carts
  has_many :user_orders, through: :carts
end
