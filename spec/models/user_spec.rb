require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    context '新規登録がうまくいくとき' do
      it "情報が正しく入力されていれば登録できる" do
        user = FactoryBot.build(:user)
        user.valid?
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.nickname = ''
        user.valid?
      end
      it "メールアドレスが必須であること" do
        user = FactoryBot.build(:user)
        user.email = ''
        user.valid?
      end
      it "メールアドレスは、@を含む必要があること" do
        user = FactoryBot.build(:user)
        user.email = 'test3test.com'
        user.valid?
      end
      it "パスワードが必須であること" do
        user = FactoryBot.build(:user)
        user.password = ''
        user.valid?
      end
      it "パスワードは、6文字以上での入力が必須であること" do
        user = FactoryBot.build(:user)
        user.password = 'abc'
        user.password_confirmation = 'abc'
        user.valid?
      end
      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        user = FactoryBot.build(:user)
        user.password_confirmation = 'abc111111'
        user.valid?
      end
      it "生年月日が空だと登録できない" do
        user = FactoryBot.build(:user)
        user.birthday = ''
        user.valid?
      end
      it "お名前(全角)lastnameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.last_name = ''
        user.valid?
      end
      it "お名前(全角)firstnameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = ''
        user.valid?
      end
      it "お名前カナ(全角)lastnameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.last_name_kana = ''
        user.valid?
      end
      it "お名前カナ(全角)firstnameが空だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name_kana = ''
        user.valid?
      end
      it "お名前(全角)lastnameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.last_name = 'yamada'
        user.valid?
      end
      it "お名前(全角)firstnameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name = 'yamada'
        user.valid?
      end
      it "お名前(全角)lastnameが全角（カタカナ）以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.last_name_kana = 'yamada'
        user.valid?
      end
      it "お名前(全角)firstnameが全角（カタカナ）以外だと登録できない" do
        user = FactoryBot.build(:user)
        user.first_name_kana = 'yamada'
        user.valid?
      end
      it "メールアドレスがすでに使用されているものだと登録できない" do
        user = FactoryBot.build(:user)
        user.email = 'test@test.com'
        user.valid?
      end
      it "パスワードは半角英数字混合以外では登録できない" do
        user = FactoryBot.build(:user)
        user.password = 'ああああああああ'
        user.password_confirmation = 'ああああああああ'
        user.valid?
      end
    end
  end
end