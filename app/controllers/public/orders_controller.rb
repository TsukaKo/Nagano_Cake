class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def log
  end

  def thanks
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    if params[:order][:address_method] == "1"
      @order.name = current_customer.first_name + current_customer.last_name
      @order.addresses = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_method] == "2"
      @order.name = Order.address.find(params[:id])
     #params[:order][:address_id].to_i その中にアドレスのidが入っている。それを元に住所を検索する。address.findを使う。引っ張ってきた情報を＠order.nameなどに代入する
    elsif params[:order][:address_method].to_i == "3"

    end

    @order.save
    redirect_to log_path
  end

  def index
  end

  def show
  end

end
