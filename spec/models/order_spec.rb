require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order_address = FactoryBot.build(:order)
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address.user_id = @user.id 
    @order_address.item_id = @item.id 
  end

  describe '商品購入' do
    context '異常系' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end

      it 'post_codeが半角ハイフンを含む形でなければ登録できない' do
        @order_address.post_code = '1234567' # ハイフンを含まない形式
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code is invalid"
      end

      it 'prefecture_idが空では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it 'blockが空では登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Block can't be blank"
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが9桁以下では登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'phone_numberが12桁以上では登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'phone_numberに半角数字以外が含まれている場合は登録できない' do
        @order_address.phone_number = '123-4567-8901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end

    it 'user_idが空では登録できない' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "User can't be blank"
    end

    it 'item_idが空では登録できない' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Item can't be blank"
    end


    context '正常系' do
      it 'building_nameが空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

      it 'すべての値が存在する際に登録できる' do
        expect(@order_address).to be_valid
      end

    end
  end
end