class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "my_address"
        @order.address_postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.address_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_number] == "saved_address"
        @address = Address.find(params[:order][:address_id])
        @order.address_postal_code = @address.postal_code
        @order.address = @address.address
        @order.address_name = @address.name
    elsif params[:order][:address_number] == "new_address"
        @order.address_postal_code = params[:order][:address_postal_code]
        @order.address = params[:order][:address]
        @order.address_name = params[:order][:address_name]
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0){ |sum, item| sum + item.subtotal }
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
    params.require(:order).permit(:method_payment, :address_postal_code, :address, :address_name)
  end
end
