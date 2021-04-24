require 'rails_helper'

RSpec.describe UserOrder, type: :model do

  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @user_order = FactoryBot.build(:user_order, item_id:item.id, user_id:user.id)
    sleep(1)
  end

  describe "商品購入機能" do

    context '商品購入がうまくいくとき' do
      it "情報が正しく入力されていれば商品を購入できる" do
        expect(@user_order).to be_valid
      end
      it "建物名が入力されていなくても購入できる" do
        @user_order.building_name = ""
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "郵便番号がないと商品を購入できない" do
        @user_order.postal_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "都道府県が「---」だと商品を購入できない" do
        @user_order.shipping_area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it "市区町村がないと商品を購入できない" do
        @user_order.city = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it "番地がないと商品を購入できない" do
        @user_order.address = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号がないと商品を購入できない" do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it "郵便番号にはハイフンが必要であること" do
        @user_order.postal_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("郵便番号にはハイフン(-)が必要です")
      end
      it "電話番号は数字のみでないと保存できない" do
        @user_order.phone_number = "090-1234-5678"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "電話番号は12桁以上だと保存できない" do
        @user_order.phone_number = "090123456789"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "tokenが空では商品を購入できない" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it "user_idが空だと購入できない" do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("購入者を入力してください")
      end
      it "item_idが空だと購入できない" do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("商品を入力してください")
      end
    end

  end
end
