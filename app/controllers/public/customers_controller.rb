class Public::CustomersController < ApplicationController
  
  def show
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
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
  
  
end
