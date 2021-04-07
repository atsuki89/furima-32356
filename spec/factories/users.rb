FactoryBot.define do
  factory :user do
    nickname              {'furima三郎'}
    email                 {Faker::Internet.free_email}
    password              {'abc000000'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'山太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'ヤマタロウ'}
    birthday              {'2020-01-01'}
  end
end