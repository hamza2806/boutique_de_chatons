class CartsController < ApplicationController
  def index
  end

#----------------------------

  def show
    @cart = Cart.find_by(id:params[:id])
  end

#----------------------------

  def new
  end

#----------------------------

  def create
  end

#----------------------------

  def edit
  end

#----------------------------

  def update

    @cart_item = JoinCartItem.find_by(cart_id:params[:cart_id], item_id:params[:item_id])
    @item_id = params[:item_id]

    if @cart_item.destroy
      respond_to do |format|
        format.html { redirect_to cart_path(params[:cart_id]) }
        format.js { }
      end
    else
      flash.now[:error] = @cart_item.errors.full_messages.to_sentence
      render :cart_path
    end

  end

#----------------------------

  def destroy
  end

#----------------------------

end
