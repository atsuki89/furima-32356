class ItemsController < ApplicationController
  before_action :move_to_sessions, only: [:new]

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_sessions
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :estimated_shipping_date_id, :image).merge(user_id: current_user.id)
  end

end
