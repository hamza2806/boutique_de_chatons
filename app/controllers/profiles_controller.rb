class ProfilesController < ApplicationController

  def show
  	    puts "*****************************"
		puts params
        puts "*****************************"
    @user = User.find(params[:id])
    @orders = @user.orders
  end

end
