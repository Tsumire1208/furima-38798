class ItemsController < ApplicationController
  
  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :item_description, :category_id, :condition_id, :freight_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
