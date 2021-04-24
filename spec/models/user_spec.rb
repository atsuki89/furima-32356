require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context '新規登録がうまくいくとき' do
      it "情報が正しく入力されていれば登録できる" do
        @user
        @user.valid?
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "メールアドレスが必須であること" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "メールアドレスは、@を含む必要があること" do
        @user.email = 'test3test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "パスワードが必須であること" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "パスワードは、6文字以上での入力が必須であること" do
        @user.password = 'abc'
        @user.password_confirmation = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        @user.password_confirmation = 'abc111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "お名前(全角)lastnameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it "お名前(全角)firstnameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it "お名前カナ(全角)lastnameが空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓カナを入力してください")
      end
      it "お名前カナ(全角)firstnameが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名カナを入力してください")

      end
      it "お名前(全角)lastnameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は不正な値です")
      end
      it "お名前(全角)firstnameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("名は不正な値です")
      end
      it "お名前(全角)lastnameが全角（カタカナ）以外だと登録できない" do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓カナは不正な値です")
      end
      it "お名前(全角)firstnameが全角（カタカナ）以外だと登録できない" do
        @user.first_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("名カナは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "パスワードは半角英数字混合以外では登録できない" do
        @user.password = 'ああああああああ'
        @user.password_confirmation = 'ああああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
    end
  end
end