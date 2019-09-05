class OrdersController < ApplicationController

  before_action :authenticate_user!

  #------------------------------
  def index
    @orders = Order.all
  end

  #------------------------------

  def show
  	@order = Order.find(params[:id])
  end

  #------------------------------

  def new
  	@order = Order.new
  	@user = current_user
  	@amount = @user.cart.total_price
  end

  #------------------------------

  def create
  	
    unless
      current_user.cart.items.count == 0

  	@amount = (current_user.cart.total_price*100).to_i

           customer = Stripe::Customer.create({
                                                email: params[:stripeEmail],
                                                source: params[:stripeToken],
           })


           charge = Stripe::Charge.create({
                                            customer: customer.id,
                                            amount: @amount,
                                            description: 'Rails Stripe customer',
                                            currency: 'eur',
           })
    end

      @order = Order.create(user_id: current_user.id, total_price: current_user.cart.total_price)
      @order.items = current_user.cart.items
      current_user.orders << @order
      flash[:success] = "Merci pour votre paiement! Vous recevrez un email de confirmation"


      # call method to empty cart once order is saved
      current_user.cart.delete_all_items

      flash[:success] = "Votre paiement a bien été enregistré, vous allez recevoir un email de confirmation."
      redirect_to order_path(@order.id)


     rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to cart_path(current_user.cart.id)

  end
  
end
