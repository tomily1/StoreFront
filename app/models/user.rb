class User < ApplicationRecord
  has_many :user_orders, dependent: :destroy

  validates :email, presence: true, uniqueness: true, email: true
end