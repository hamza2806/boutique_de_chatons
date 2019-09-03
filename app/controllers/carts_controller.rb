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


    # Two options depending on parameter value : 1/ suppress all items 2/ suppress only selected item
    # /1
    if params[:suppress_all] == true

    # TO COMPLETE

    # /2
    elsif params[:suppress_all] == "false"

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

  end

#----------------------------

  def destroy
  end

#----------------------------

end
