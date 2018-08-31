FactoryBot.define do
  factory :product do
    name { "Test" }
    details { Faker::Lorem.paragraph(10) }
    size { "N/A" }
    price { 20.20 }
  end
end