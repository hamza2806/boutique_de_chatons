class ItemPicturesController < ApplicationController
	def create

  	@item = Item.find(params[:item_id])
  	@item.item_pictures.attach(params[:item_pictures])
	  redirect_to item_path(@item)
    end
end
