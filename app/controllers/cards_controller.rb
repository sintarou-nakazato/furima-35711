class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || @item.card.present?
    @card_destination = CardDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @card_destination = CardDestination.new(card_params)
    if @card_destination.valid?
      pay_item
      @card_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def card_params
    params.require(:card_destination).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :card_id).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: card_params[:token],
      currency: 'jpy'
    )
  end
end
