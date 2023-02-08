class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.update!(order_detail_params)
      @order_detail.order.update(order_status: 2) if @order_details.making_status == "production"
      @order_detail.order.update(order_status: 3) if @order_details.making_status_all == "completion"
      redirect_back(fallback_location: root_path)
    end
  end
  private
  def order_detail_params
    params.require(:order_detail).permit(:customer_id, :address_postal_code, :address, :address_name, :postage, :money, :method_payment, :making_status)
  end
end
