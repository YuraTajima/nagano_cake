class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
    else
      @cart_items = current_customer.cart_items.new(cart_item_params)
      @cart_items.save
    end
    redirect_to cart_items_path
  end
  
  def index
    @cart_items = current_customer.cart_items.all
    @sum = 0
    
  end

  def update
    @cart_items = CartItem.find(params[:id])
    if params[:cart_item][:amount] == 0
      @cart_item.destroy
      redirect_to cart_items_path
    elsif @cart_items.update(amount: params[:cart_item][:amount])
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
      redirect_to "cart_items/index"
    end
  end

  def destroy
    current_customer.cart_items.find(params[:id]).destroy
    cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
