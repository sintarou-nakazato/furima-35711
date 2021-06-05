class CardDestination
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :card

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :building_name
    validates :phone_number
  end

  validates :building_name

  def save
    card = Card.create(user: user, item:item)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, card: card)
  end
end