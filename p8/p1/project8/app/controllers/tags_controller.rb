class TagsController < ApplicationController
	def new
		@photo = Photo.find(params[:id])
		@tag = Tag.new
	end

	def create
		@photo = Photo.find(params[:id])
		@tag = Tag.new
		if request.post? then
			if session[:id] then
				@tag.user_id = params[:tag][:user]
				@tag.photo_id = params[:id]
				@tag.left = params[:tag][:left]
				@tag.top = params[:tag][:top]
				@tag.width = params[:tag][:width]
				@tag.height = params[:tag][:height]
				if @tag.save then
					redirect_to("/photos/index/"+@photo.user_id.to_s)
				else
					@error_message = "You must select a region in the picture before sumbitting."
					render(action: :new)
				end
			else
				@error_message = "You are not logged in. You must login before making a comment."
				flash[:photoId] = @photoId
				render(action: :new)
			end
		else
			render(action: :new)
		end
	end
end
