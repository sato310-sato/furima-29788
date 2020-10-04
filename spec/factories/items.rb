FactoryBot.define do
  factory :item do
    name { '商品名' }
    category_id { 11 }
    price { 400 }
    item_text { 'あいうえお' }
    delivery_free_id { 2 }
    product_condition_id { 7 }
    delivery_source_id { 3 }
    estimated_delivery_id { 4 }
    image { Faker::Lorem.sentence }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
