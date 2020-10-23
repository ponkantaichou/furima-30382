FactoryBot.define do
  factory :item do
    description { Faker::Lorem.sentence }
    name { Faker::Team.name }
    association :user

    category_id { 2 }
    shipping_day_id { 2 }
    shipment_source_id { 2 }
    shipping_id { 2 }
    status_id { 2 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
