require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
  end

  describe '購入者情報登録' do
    context '購入者情報登録できるとき' do
      it 'postal_code, prefecture_id, municipalities, address, phone, user_id, item_idが存在すれば登録できる' do
        expect(@order_buyer).to be_valid
      end
      it '建物名が空でも登録できること' do
        @order_buyer.building = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '購入者情報登録ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと保存できないこと' do
        @order_buyer.postal_code = 1_234_567
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが---では登録できない' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Prefecture Select')
      end

      it '市区町村が空だと保存できないこと' do
        @order_buyer.municipalities = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_buyer.phone = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号にハイフンがあると保存できないこと' do
        @order_buyer.phone = '123-4567-8901'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号が12桁以上あると保存できないこと' do
        @order_buyer.phone = 123_456_789_012
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone is invalid')
      end

      it '電話番号が9桁以下では保存できないこと' do
        @order_buyer.phone = 123_456_789
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Phone is invalid')
      end

      it 'user_idが空だと保存できない' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
