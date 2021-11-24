class Admin::OrdersDetailsController < ApplicationController

  def update
  end

  private
  def orders_detail_params
    params.require(:order_detail).permit(:amount)
  end

end
