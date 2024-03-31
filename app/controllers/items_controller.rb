class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :noedit, only: :edit
  before_action :noedit_user, only: :edit
  before_action :find_item, only: [:show, :edit, :update, :destroy]

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
  end

def edit
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @item.destroy
  redirect_to root_path
end



  private

  def item_params
    params.require(:item).permit(:item_name, :detail, :price, :image, :situation_id, :delivery_day_id, :load_style_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
   end

   def noedit
    unless user_signed_in? && current_user == Item.find(params[:id]).user
    redirect_to action: :index
    end
   end

   def noedit_user
    find_item
    if current_user != @item.user ||  Item.exists?(id: @item.id) && BuyingHistory.where(item_id: @item.id).exists?
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
