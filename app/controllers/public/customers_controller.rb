class Public::CustomersController < ApplicationController

  def show
    @customer = Cusutomer.find(params[:id])
  end

  def edit
    @customer = Cusutomer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

end
