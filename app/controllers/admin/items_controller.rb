class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item)
  end
  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:price)
  end
end

