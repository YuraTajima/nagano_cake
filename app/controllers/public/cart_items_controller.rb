class Public::CartItemsController < ApplicationController
  
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
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_items = CartItem.find(params[:id])
    cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
