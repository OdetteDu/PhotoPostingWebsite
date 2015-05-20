class PhotosController < ApplicationController
	def index
		@id = params[:id]
		@photos = User.find(@id).photos
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new
		if request.post? then
			if session[:id] then
				if params[:photo] then
					fileName = params[:photo][:file].original_filename
					path = "app/assets/images/"+fileName
					File.open(path, "wb"){|file| file.write(params[:photo][:file].read)}
					@photo.user_id = session[:id]
					@photo.date_time = DateTime.now
					@photo.file_name = fileName
					if @photo.save then
						redirect_to("/photos/index/"+@photo.user_id.to_s)
					else
						render(action: :new)
					end
				else
					@error_message = "You must choose a photo to upload"
					render(action: :new)
				end
			else
				@error_message = "You are not logged in. You must login before uploading a photo."
				render(action: :new)
			end
		else
			render(action: :new)
		end
	end
end
