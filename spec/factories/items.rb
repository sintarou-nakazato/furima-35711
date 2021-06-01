FactoryBot.define do
  factory :item do
    # image                   { '画像' }
    product_name            { '商品' }
    product_description     { '長文' }
    category_id             { 2 }
    condition_id            { 2 }
    cost_id                 { 2 }
    area_id                 { 2 }
    day_id                  { 2 }
    price                   { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
