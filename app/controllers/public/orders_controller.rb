class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
  end

  def comfirm
    @cart_items = current_customer.cart_items.all
    @order = current_customer.order.all
    @sum = 0
    @shipping_cost = 800
    @total_payment = 0
    @order_details = OrderDetails.new
  end

  def complete
    @order_details = current_customer.order_details.new(order_details_params)
    @order_details.save
  end

  def create
    @order = current_customer.order.new(order_params)
    @order.save
     redirect_to orders_comfirm_path
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :states)
  end
end
