class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    #@order_detail = OrderDetail.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(orders_params)
  end

  private
  def orders_params
    params.require(:order).permit(:name, :addresses, :payment_method, :postage, :order_active, :billing_amount, :postal_code)
  end

end
