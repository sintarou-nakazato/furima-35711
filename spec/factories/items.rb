FactoryBot.define do
  factory :item do
    # image                   { '画像' }
    product_name            { '商品' }
    product_description     { '長文' }
    category_id             { '000' }
    condition_id            { '000' }
    cost_id                 { '000' }
    area_id                 { '000' }
    day_id                  { '000' }
    price                   { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
