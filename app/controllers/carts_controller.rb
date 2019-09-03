class CartsController < ApplicationController
  def index
  end

  def show
    @cart = Cart.find_by(id:params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
