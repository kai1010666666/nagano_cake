class Admin::ItemsController < ApplicationController
  def new
    @items = Item.new
  end
  def create
    @item = Item.new(item_params)
    @item.save
    redairect_to items_path(@item)
  end
  def index
  end

  def show
  end

  def edit
  end
  
    def item_params
    params.require(:item).permit(:genre,:name,:introduction,:price)
  end
end

