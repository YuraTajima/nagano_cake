class Public::CartItemsController < ApplicationController
  
  def create
    @cart_items = current_customer.cart_items.new(cart_item_params)
    @cart_items.save
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
  end

  def destroy_all
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
