class CardsController < ApplicationController
  def index
    @card_destination = CardDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @card_destination = CardDestination.new(card_params)
    if @card_destination.valid?
       @card_destination.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def card_params
    params.require(:card_destination).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :card_id).merge(user_id: current_user.id, item_id: @item.id)
  end

end
