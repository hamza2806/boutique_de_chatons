class CartsController < ApplicationController

  # user must be signed in to show his cart
  before_action :authenticate_user!, only: [:show]

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
    @cart = Cart.new
    @cart.user_id = current_user.id
    @cart.save

  end

#----------------------------

  def edit
  end

#----------------------------

  def update

    # Add selected item to cart_id
    # TO COMPLETE


    @cart = Cart.find_by(id:params[:cart_id])
    @params_delete_all = params[:suppress_all]

    # Two options depending on parameter value : 1/ suppress all items 2/ suppress only selected item
    # /1 suppress all items
    if @params_delete_all == "true"

      @cart.items.each do |item|
        @cart_item = JoinCartItem.find_by(cart_id:@cart.id, item_id:item.id)
        @item_id = item.id
        # loop on each items on the cart, suppression of each couple on JoinCartItem
        @cart_item.destroy
      end
        respond_to do |format|
          format.html { redirect_to cart_path(@card.id) }
          format.js { }
        end

    # /2 suppress only selected item
    elsif @params_delete_all == "false"
      @item_id = params[:item_id]
      @cart_item = JoinCartItem.find_by(cart_id:@cart.id, item_id:@item_id)
      if @cart_item.destroy
        respond_to do |format|
          format.html { redirect_to cart_path(@card.id) }
          format.js { }
        end
      else
        flash.now[:error] = @cart_item.errors.full_messages.to_sentence
        render :"show"
      end

    end

  end

#----------------------------

  def destroy
  end

#----------------------------

end
