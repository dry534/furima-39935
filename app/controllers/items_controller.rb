class ItemsController < ApplicationController
  def index
    
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

  private

  def item_params
    params.require(:item).permit(:item_name, :detail, :price, :image, :situation_id, :delivery_day_id, :load_style_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
   end

end
