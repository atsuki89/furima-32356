class UserOrder
  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :card_number, format: { /\A[0-9]+\z/ }
    validates :card_exp_month, format: { /\A[0-9]+\z/ }
    validates :card_exp_year, format: { /\A[0-9]+\z/ }
    validates :card_cvc, format: { /\A[0-9]+\z/ }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, format: { /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number
    validates :phone_number, format: { /\A\d{10,11}\z/ }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }


  def save
    Order.create(card_number: card_number, card_exp_month: card_exp_month, card_exp_year: card_exp_year, card_cvc: card_cvc, user_id: user.id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, user_id: user.id)
  end

end