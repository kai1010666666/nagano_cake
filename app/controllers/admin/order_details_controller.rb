class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.update!(order_detail_params)
      @order_detail.order.update(order_status: 2) if @order_detail.making_status == "production"
     order = @order_detail.order
    flag = true
    order.order_details.each do |order_detail|
      if  order_detail.making_status != "completion"
        flag = false
      end
    end
    if flag
      order.update(order_status: "preparing")
    end
    redirect_back(fallback_location: root_path)
    end
  end
  private
  def order_detail_params
    params.require(:order_detail).permit(:customer_id, :address_postal_code, :address, :address_name, :postage, :money, :method_payment, :making_status)
  end
end
