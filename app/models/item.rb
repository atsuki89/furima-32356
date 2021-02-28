class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :estimated_shipping_date

  validates :name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :estimated_shipping_date_id, :image, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :estimated_shipping_date_id
  end

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
