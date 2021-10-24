class Admin::ItemsController < ApplicationController

  def new
    @items = Items.new
  end

  def create
    @items = Items.new(items_params)
    @items.save

  end

  def index
    @items = Items.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def items_params
    params.require(:items).permit(:)
end
