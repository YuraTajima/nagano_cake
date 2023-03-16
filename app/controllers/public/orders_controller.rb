class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def comfirm
    @sum = 0
    @total_payment = 0
    @cart_items = current_customer.cart_items.all
    
    if params[:order][:address_number] == "1"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
    elsif params[:order][:address_number] == "2"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    
    elsif params[:order][:address_number] == "3"
      @order = Order.new(order_params)
    
    else
      redirect_to cart_items_path
    end
    @order.states = 0
    @order.shipping_cost = 800
  end

  def complete
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.price = cart.item.price * 1.1
        order_detail.amount = cart.amount
        order_detail.making_status = 0
        order_detail.save!
      end
      redirect_to orders_complete_path
      @cart_items.destroy_all
    else
      @order = Order.new
      render :new
    end
  end

  def index
  end

  def show
  end
  
  
  private
  
  def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :states)
  end
  
  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
  
end
