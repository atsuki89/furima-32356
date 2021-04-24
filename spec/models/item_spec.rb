require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do

    context '商品出品がうまくいくとき' do
      it "情報が正しく入力されていれば商品を出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品名がないと商品を出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "商品の説明がないと商品を出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "カテゴリー情報がないと商品を出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "カテゴリー情報が「---」だと商品を出品できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it "商品の状態についての情報がないと商品を出品できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "商品の状態が「---」だと商品を出品できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it "配送料の負担についての情報がないと商品を出品できない" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "配送料の負担が「---」だと商品を出品できない" do
        @item.shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it "発送元の地域についての情報がないと商品を出品できない" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を入力してください")
      end
      it "発送元の地域が「---」だと商品を出品できない" do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域は1以外の値にしてください")
      end
      it "発送までの日数についての情報がないと商品を出品できない" do
        @item.estimated_shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "発送までの日数が「---」だと商品を出品できない" do
        @item.estimated_shipping_date_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it "価格についての情報がないと商品を出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it "価格が、¥300以上でないと商品を出品できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
      it "価格が、¥9,999,999以下でないと商品を出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it "販売価格は半角数字の入力でないと商品を出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it "商品画像がないと商品を出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "販売価格は全角文字では登録できないこと" do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it "販売価格は半角英数混合では登録できないこと" do
        @item.price = "a1b2c3"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it "販売価格は半角英語だけでは登録できないこと" do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
