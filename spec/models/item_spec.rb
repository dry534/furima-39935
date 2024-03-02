require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '正常系' do
      it '適切な値を入力すればitemを出品できる' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300以上でないと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '価格が9,999,999以下でないと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it '価格は半角数値のみであること' do
        @item.price = '１０００' # 全角数字
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"

        @item.price = 'abc' # 文字列
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"

        @item.price = '!@#' # 特殊文字
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it 'situation_idが1では登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Situation must be other than 1"
      end

      it 'delivery_day_idが1では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day must be other than 1"
      end

      it 'load_style_idが1では登録できない' do
        @item.load_style_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Load style must be other than 1"
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it 'ユーザーと紐づかないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
