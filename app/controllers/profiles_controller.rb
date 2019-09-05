class ProfilesController < ApplicationController

  def show
  	    puts "*****************************"
		puts params
        puts "*****************************"
    @user = current_user
    @orders = @user.orders
  end

end
