FactoryBot.define do
  factory :card_destination do
    postal_code            { '353-9761' }
    prefecture_id          { 2 }
    city                   { '堺市' }
    address { '山田1-1-1' }
    building_name          {}
    phone_number           { '08012341234' }
    token                  { '38ists4553' }
  end
end
