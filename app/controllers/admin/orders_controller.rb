class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(order_params)
    @order.update
    redirect_to admin_orders_path(@order.id)
  end
  private
  def order_params
    params.require(:order).permit(:customer_id, :address_postal_code, :address, :address_name, :postage, :money, :method_payment)
  end
end
