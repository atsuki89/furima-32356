FactoryBot.define do
  factory :item do
    name                       {'test太郎'}
    description                {'test'}
    price                      {1000}
    category_id                {2}
    condition_id               {2}
    shipping_charge_id         {2}
    shipping_area_id           {2}
    estimated_shipping_date_id {2}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end