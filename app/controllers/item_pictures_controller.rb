class ItemPicturesController < ApplicationController
	def create
        puts "*****************************"
		puts params
        puts "*****************************"

  	@item = Item.find(params[:item_id])
  	@item.item_pictures.attach(params[:item_pictures])
  		redirect_to item_path(@item)
    end


  def update
    @item = Item.find(params[:item_id])
    @item.item_pictures.update(params[:item_pictures])
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @item.item_pictures.destroy(params[:item_pictures])
    redirect_to item_path(@item)
  end
end
