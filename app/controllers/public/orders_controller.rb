class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
  end

  def completion
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to order_path(@order)
  end

  def index
    
  end

  def show
  end
  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
