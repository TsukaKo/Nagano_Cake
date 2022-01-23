class Admin::OrdersDetailsController < ApplicationController

  def update
    @orders_detail = OrderDetail.find(params[:id])
    @order = @orders_detail.order
    @orders_detail.update!(orders_detail_params)
    redirect_to admin_order_path(@order.id)
  end

  private
  def orders_detail_params
    params.require(:order_detail).permit(:amount, :making_status, :price, :item_id, :order_id)
  end

end
