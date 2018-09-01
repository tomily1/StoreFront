FactoryBot.define do
  factory :delivery_method do
    name {  Faker::Lorem.paragraph(1) }
    price { 20.20 }
  end
end
