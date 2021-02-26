class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  
  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
