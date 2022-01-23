class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(orders_params)
    redirect_to admin_root_path
  end

  private
  def orders_params
    params.require(:order).permit(:name, :addresses, :payment_method, :postage, :order_active, :billing_amount, :postal_code)
  end

end
