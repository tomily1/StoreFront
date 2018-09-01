class DeliveryMethod < ApplicationRecord
  has_many :user_orders
end