class ItemPicturesController < ApplicationController
	def create
        puts "*****************************"
		puts params[:profile_id]
        puts "*****************************"

  	@item = Item.find(params[:admin_id])
  	@item.item_pictures.attach(params[:item_pictures])
    redirect_to item_path(@item)
  end
end
