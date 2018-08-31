FactoryBot.define do
  factory :cart do
    association :user_order
    association :product
    quantity { 1 }
  end
end