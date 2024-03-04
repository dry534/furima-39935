class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @items = Item.order(created_at: :desc)
  end

def new
  @item = Item.new
end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to'/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :detail, :price, :image, :situation_id, :delivery_day_id, :load_style_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
   end


end
