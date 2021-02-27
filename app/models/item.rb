class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :estimated_shipping_date

  validates :name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :estimated_shipping_date_id, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :estimated_shipping_date_id, numericality: { other_than: 1 }

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
