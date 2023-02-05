class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(10)
    @quantity = 0
  end
end
