class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if  if params[:order][:address_number] == "my_address"
          @order.address_postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.address_name = current_customer.first_name + current_customer.last_name
        elsif params[:order][:address_number] == "saved_address"
          @address = Address.find(params[:order][:address_id])
          @order.address_postal_code = @address.postal_code
          @order.address = @address.address
          @order.address_name = @address.name
      elsif params[:order][:address_number] == "new_address"
      end
      @cart_items = current_customer.cart_items.all
      @total = @cart_items.inject(0){ |sum, cart_item| sum + cart_item.subtotal }
    else
      render :index
    end
  end

  def completion
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.save
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_detail.money = cart_item.item.with_tax_price #消費税込みに計算して代入
      @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
      @order_detail.save #注文商品を保存
    end
    @cart_items.destroy_all
    redirect_to orders_completion_path
  end

  def index
    @orders = current_customer.order.all
  end

  def show
    @order = current_customer.order.find(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:method_payment, :address_postal_code, :address, :address_name, :money)
  end
end
