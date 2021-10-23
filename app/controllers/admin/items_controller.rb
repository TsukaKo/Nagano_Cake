class Admin::ItemsController < ApplicationController

  def new
    @items = Items.new
  end

  def create
    @items = Items.new(items_params)
    @items.user_id = current_user.id
    @items.save

  end

  def index
    @items = Items.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def items_params
    params.require(:items).permit(:)
end
