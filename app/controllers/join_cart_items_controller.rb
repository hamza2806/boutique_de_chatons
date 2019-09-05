class JoinCartItemsController < ApplicationController

  def create
    @cart = Cart.find_by(user_id:current_user.id)
    @cart.add_item(@cart.id,params[:item_id])


    if @cart.save
      flash[:success] = "Cet article a bien été ajouté à votre panier."
      redirect_to items_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to items_path
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

end
