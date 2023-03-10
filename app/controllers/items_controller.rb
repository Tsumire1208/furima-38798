class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :match_user, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    if @item.order.nil?
  else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(item_params)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_description, :category_id, :condition_id, :freight_id, :prefecture_id,
                                 :delivery_time_id, :price, {images: []}).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def match_user
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
