class CommentsController < ApplicationController
	def new
		@photo = Photo.find(params[:id])
		@comment = Comment.new
	end

	def create
		@photo = Photo.find(params[:id])
		@comment = Comment.new
		if request.post? then
			if session[:id] then
				@comment.user_id = session[:id]
				@comment.photo_id = params[:id]
				@comment.date_time = DateTime.now
				@comment.comment = params[:comment][:comment].to_s
				if @comment.save then
					redirect_to("/photos/index/"+@photo.user_id.to_s)
				else
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

	private
  def comment_params(params)
    return params.permit(:photo_id, :user_id, :date_time, :comment)
  end
end
