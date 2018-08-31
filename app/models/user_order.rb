class UserOrder < ApplicationRecord
  has_many :carts
end