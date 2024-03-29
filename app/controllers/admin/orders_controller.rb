class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @sum = 0
    @shipping_cost = 800
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    end
    redirect_to admin_order_path(@order)
  end

  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
