namespace :storefront do
  namespace :seed do
    desc "Seeding database"
    task create: :environment do
      4.times do
        random_value = (200.0 - 5.0) * rand() + 5
        DeliveryMethod.create(name: Faker::Lorem.paragraph(1), price: random_value)
      end

      10.times do
        random_value = (200.0 - 5.0) * rand() + 5
        Product.create(name: Faker::Lorem.paragraph(1),
                       details: Faker::Lorem.paragraph(10),
                       size: "N/A", price: random_value
        )
      end
    end

    task clear: :environment do
      DeliveryMethod.destroy_all
      Product.destroy_all
    end
  end
end
