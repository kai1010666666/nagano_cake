class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.update!(order_params)
      @order.order_details.update_all(making_status: 1) if @order.order_status == "confirm"
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :address_postal_code, :address, :address_name, :postage, :money, :method_payment, :order_status)
  end
end
