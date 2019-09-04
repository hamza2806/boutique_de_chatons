class JoinCartItemsController < ApplicationController
   
  def create
    @cart = Cart.find_by(user_id:current_user.id)
    @cart.add_item(@cart.id,params[:item_id])

     
    if @cart.save
      redirect_to root_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to @items
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

end