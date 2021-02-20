require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "test3@test.com", password: "abc000000", password_confirmation: "abc000000", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end
    it "メールアドレスが必須であること" do
      user = User.new(nickname: "furima三郎", email: "", password: "abc000000", password_confirmation: "abc000000", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end
    it "メールアドレスは、@を含む必要があること" do
      user = User.new(nickname: "furima三郎", email: "test3test.com", password: "abc000000", password_confirmation: "abc000000", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end
    it "パスワードが必須であること" do
      user = User.new(nickname: "furima三郎", email: "test3@test.com", password: "", password_confirmation: "", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      user = User.new(nickname: "furima三郎", email: "test3@test.com", password: "abc", password_confirmation: "abc", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      user = User.new(nickname: "furima三郎", email: "test3@test.com", password: "abc000000", password_confirmation: "abc111111", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end

  end
end
