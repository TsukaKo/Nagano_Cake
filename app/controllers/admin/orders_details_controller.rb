class Admin::OrdersDetailsController < ApplicationController

  def update
    @orders_detail = Order.find(params[:id])
    @orders_detail.update(orders_detail_params)
  end

  private
  def orders_detail_params
    params.require(:order_detail).permit(:amount, :maiking_status, :price, :item_id, :order_id)
  end

end
