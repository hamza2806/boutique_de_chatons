class ItemsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.create(item_params)
  	@item.admin_id = current_user.id
  end

  private
  def item_params
  	params.require(:item).permit(:id, :title, :description, :price, :image_url)
  end

end
