class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer!

  def create
    @cart_item = 
  end

  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item.id)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    current_customer.cart_items.destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:cart_item_id, :item_id, :amount, :customer_id, :created_at, :updated_at)
  end
end
