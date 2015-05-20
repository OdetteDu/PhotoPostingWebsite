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

	def search
		word = params[:word].downcase
		searchedPhotos = Set.new
		if not word.empty? then
			Comment.all.each do |c|
				if c.comment.downcase.include? word
					searchedPhotos << c.photo_id
				end
			end

			Tag.all.each do |t|
				if t.user.first_name.downcase.include? word or t.user.last_name.downcase.include? word
					searchedPhotos << t.photo_id
				end
			end
		end

		photos = Array.new
		searchedPhotos.each do |p|
			photo = Photo.find(p)
			image = view_context.image_path(photo.file_name)
			url = "/photos/index/"+photo.user_id.to_s+"\#img"+photo.id.to_s
			photos << {image: image, url: url}
		end
		result = {result: photos}
		render :json => result.to_json
	end
end
