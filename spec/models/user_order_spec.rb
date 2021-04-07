require 'rails_helper'

RSpec.describe UserOrder, type: :model do

  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe "商品購入機能" do

    context '商品購入がうまくいくとき' do
      it "情報が正しく入力されていれば商品を購入できる" do
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "郵便番号がないと商品を購入できない" do
        @user_order.postal_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が「---」だと商品を購入できない" do
        @user_order.shipping_area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "市区町村がないと商品を購入できない" do
        @user_order.city = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと商品を購入できない" do
        @user_order.address = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号がないと商品を購入できない" do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "郵便番号にはハイフンが必要であること" do
        @user_order.postal_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "電話番号にはハイフンは不要で11桁以内であること" do
        @user_order.phone_number = "090-1234-5678"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では商品を購入できない" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
end
