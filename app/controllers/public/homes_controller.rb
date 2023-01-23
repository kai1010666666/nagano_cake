class Public::HomesController < ApplicationController
  def top
    @items = Item.all.last(4).sort.reverse
  end

  def about
  end
end
