class Admin::OrdersDetailsController < ApplicationController
  def update
    @orders_detail = OrderDetail(params[:id])
    @orders_detail.update(orders_detail_params)
    redirect_to address_orders_path(@order.id)
  end
  private
  def orders_detail_params
    params.require(:order_detail).permit(:customer_id, :address_postal_code, :address, :address_name, :postage, :money, :method_payment)
  end
end
