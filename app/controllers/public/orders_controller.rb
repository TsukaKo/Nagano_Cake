class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def log
    @order = current_customer.orders.new
    @order.payment_method = params[:order][:payment_method]
    @order.postage = 800
    @cart_item = current_customer.cart_items
    if params[:order][:address_method] == "1"
      @order.name = current_customer.first_name + current_customer.last_name
      @order.addresses = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_method] == "2"
      @order.name = Address.find(params[:order][:address_id])
    elsif params[:order][:address_method] == "3"
      @order.name = params[:order][:name]
      @order.postal_code = params[:order][:postal_code]
      @order.addresses = params[:order][:address]
    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    puts "==========="
    p @order
    @order.customer_id = current_customer.id
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
    current_customer.cart_items.destroy_all
    redirect_to thanks_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :addresses, :name, :payment_method, :postage, :order_active, :billing_amount, :postal_code)
  end

end
