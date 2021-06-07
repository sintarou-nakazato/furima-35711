class CardDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code,         format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city,                format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number,        format: {with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :token
  end
  validate :building_name


  def save
    card = Card.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, card_id: card.id)
  end
end