class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    if address_id = :address_address_id_new_address
      @order = Order.new(order_params)
    elsif address_id = :address_address_id_saved_address
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else address_id = :address_address_id_my_address
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
  end

  def completion
  end

  def create
  end

  def index
    
  end

  def show
  end
  private
  def order_params
    params.require(:order).permit(:payment_method, :address_postal_code, :address, :address_name)
  end
end
