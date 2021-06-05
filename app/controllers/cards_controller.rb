class CardsController < ApplicationController
  def index
  end

  def create
    @card = Card.create(card_params)
    Destination.create(destination_params)
    redirect_to root_path
  end

  private

  def card_params
    params.merge(user_id: current_user.id, item_id: current_item.id)
  end

  def destination_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).marge(card_id: @card)
  end
end
