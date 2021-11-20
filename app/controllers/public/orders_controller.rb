class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def log
    if params[:order][:address_method] == "1"
      @order.name = current_customer.first_name + current_customer.last_name
      @order.addresses = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_method] == "2"
      @order.name = Order.address.find(params[:id])
     #params[:order][:address_id].to_i その中にアドレスのidが入っている。それを元に住所を検索する。address.findを使う。引っ張ってきた情報を＠order.nameなどに代入する
    elsif params[:order][:address_method].to_i == "3"

    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    cart_item = current_customer.cart_items.all
    @order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.making_status = "no_running"
      order_detail.save
    end
    cart_item.all_destroy
    redirect_to thanks_path
  end

  def index
  end

  def show
  end

end
