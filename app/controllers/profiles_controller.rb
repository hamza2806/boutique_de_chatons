class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @orders = @user.orders
  end

end
