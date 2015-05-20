class PhotosController < ApplicationController
	def index
		@id = params[:id]
		@photos = Photo.where("user_id=#{@id}")
	end
end
