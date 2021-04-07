class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :shipping_area_id, numericality: { other_than: 1 }


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end