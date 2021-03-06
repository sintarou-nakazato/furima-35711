require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '内容に問題がない場合' do
      it 'すべての項目の入力が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'product_nameが空なら登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it 'product_descriptionが空なら登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'category_idが空なら登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank", 'Category is not a number'
      end
      it 'condition_idが空なら登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank", 'Condition is not a number'
      end
      it 'cost_idが空なら登録できない' do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost can't be blank", 'Cost is not a number'
      end
      it 'area_idが空なら登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank", 'Area is not a number'
      end
      it 'day_idが空なら登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank", 'Day is not a number'
      end
      it 'priceが空なら登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceは¥300以下なら登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceは¥10000000以上なら登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceは半角数字で無ければ登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'category_idが1なら登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'condition_idが1なら登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end
      it 'cost_idが1なら登録できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Cost must be other than 1'
      end
      it 'area_idが1なら登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area must be other than 1'
      end
      it 'day_idが1なら登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Day must be other than 1'
      end
      it 'priceが全角文字では登録できない' do
        @item.price = 'さんびゃく'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = '300ss'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角英語だけでは登録できない' do
        @item.price = 'money'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'imageが空なら登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
