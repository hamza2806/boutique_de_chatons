class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  #------------------------------
  
  def index
    @items = Item.all
  end

  #------------------------------

  def show
  	@item = Item.find(params[:id])
  end

  #------------------------------

  def new
  	@item = Item.new
  end

  #------------------------------

  def create
  	@item = Item.new(item_params)
  	@item.admin= current_user
    if @item.save 
    flash[:success] ="Votre produit a bien été enregistré"
    redirect_to item_path(@item.id)
    else
      flash.now[:error] = @item.errors
      render "new"
    end
  end

  #------------------------------

  private
  def item_params
  	params.require(:item).permit(:id, :title, :description, :price, :image_url)
  end

end
