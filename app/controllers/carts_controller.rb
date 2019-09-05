class CartsController < ApplicationController

 before_action :authenticate_user!
 helper_method :current_cart



  # user must be signed_in to show his cart


  def index
  end

#----------------------------

  def show
    @cart = Cart.find_by(id: params[:id])
    unless current_user.id == @cart.user_id
      flash[:alert] = "Vous n'avez pas accès à ce panier"
      redirect_to root_path
      return
    end
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

    @cart = Cart.find_by(id:params[:cart_id])
    @params_delete_all = params[:suppress_all]

    # Two options depending on parameter value : 1/ suppress all items 2/ suppress only selected item
    # /1 suppress all items
    if @params_delete_all == "true"
        @cart.delete_all_items
        respond_to do |format|
          format.html { redirect_to cart_path(@card.id) }
          format.js { }
        end

    # /2 suppress only selected item
    elsif @params_delete_all == "false"

      @item_id = params[:item_id]
      if @cart.delete_item(@item_id)
        respond_to do |format|
          format.html { redirect_to cart_path(@card.id) }
          format.js { }
        end
      else
        flash.now[:error] = @cart.errors.full_messages.to_sentence
        render :"show"
      end

    end

  end

#----------------------------

  def destroy
  end

#----------------------------

end
