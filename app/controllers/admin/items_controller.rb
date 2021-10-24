class Admin::ItemsController < ApplicationController

  def new
    @items = Items.new
  end

  def create
    @items = Items.new(items_params)
    @items.save
    redirect_to admin_item_path
  end

  def index
    @items = Items.page(params[:page]).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def items_params
    params.require(:items).permit(:name, :image_id, :introduction, :price, :is_active)
end
