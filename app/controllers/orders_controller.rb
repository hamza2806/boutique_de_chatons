class OrdersController < ApplicationController

  before_action :authenticate_user!
  def index
    @orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def new
  	@order = Order.new
  	@amount = current_user.cart.total_price
  end
  def create
  	@order = Order.new(user: current_user)
  	@order.items = current_user.cart.items
  	@amount = current_user.cart.total_price*100

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
    
      @order.save
      current_user.orders << @order
      flash[:success] = "You payment has been successfully processed, you will receve a confirmation email"
      redirect_to order_path(@order.id)        
    

     rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to event_path(@event.id)
  end
end
