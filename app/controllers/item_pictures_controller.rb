class ItemPicturesController < ApplicationController
	def create
        puts "*****************************"
		puts params
        puts "*****************************"

  	@item = Item.find(params[:item_id])
  	@item.item_pictures.attach(params[:item_pictures])
  		respond_to do |format|
  			format.html {redirect_to item_path(@item)}
  			format.js {}
  		end
    end
end
