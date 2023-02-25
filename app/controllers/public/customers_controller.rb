class Public::CustomersController < ApplicationController
  
  def show
    @customers = Customer.all
  end

  def edit
    # @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customers_path(params[:id])
  end

  def unsubscribe
  end

  def withdraw
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation)
  end
end
