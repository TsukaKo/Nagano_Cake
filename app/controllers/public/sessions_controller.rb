class Public::SessionsController < ApplicationController

  # def new
  # end

  # def create
  # end

  # def destroy
  # end

  def reject_inactive_user
    @customer = Customer.find_by(name: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_active
        redirect_to new_customer_session_path
      end
    end
  end
end
