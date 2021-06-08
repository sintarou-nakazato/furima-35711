require 'rails_helper'

RSpec.describe CardDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @card_destination = FactoryBot.build(:card_destination, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it 'すべての項目の内容が正しく入力されていれば保存できる' do
        expect(@card_destination).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @card_destination.building_name = ''
        expect(@card_destination).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空なら登録できない' do
        @card_destination.postal_code = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'prefecture_idが空なら登録できない' do
        @card_destination.prefecture_id = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空なら登録できない' do
        @card_destination.city = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空なら登録できない' do
        @card_destination.address = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空なら登録できない' do
        @card_destination.phone_number = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'tokenが空なら登録できない' do
        @card_destination.token = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空なら登録できない' do
        @card_destination.user_id = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空なら登録できない' do
        @card_destination.item_id = ''
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Item can't be blank"
      end
      it 'postal_codeにハイフンがなければ登録できない' do
        @card_destination.postal_code = '3539761'
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include 'Postal code is invalid'
      end
      it 'phone_numberは11桁以下でないと登録できない' do
        @card_destination.phone_number = '123456789000'
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'prefecture_idが1なら登録できない' do
        @card_destination.prefecture_id = 1
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'phone_numberは英数混合なら登録できない' do
        @card_destination.phone_number = '080ooo'
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberは全角数字だと登録できないこと' do
        @card_destination.phone_number = '１２３'
        @card_destination.valid?
        expect(@card_destination.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end
