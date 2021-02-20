require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "test3@test.com", password: "abc000000", password_confirmation: "abc000000", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "furima三郎", email: "", password: "abc000000", password_confirmation: "abc000000", last_name:"山田", first_name: "山太郎", last_name_kana: "ヤマダ", first_name_kana: "ヤマタロウ", birthday: "")
      user.valid?
    end
  end
end
