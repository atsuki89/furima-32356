FactoryBot.define do
  factory :user_order do
    postal_code          { "123-4567" }
    shipping_area_id     { 2 }
    city                 { "横浜市緑区" }
    address              { "青山1−1−1" }
    building_name        { "柳ビル103" }
    phone_number         { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end