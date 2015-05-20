class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def login
	end

	def post_login
		if request.post? then
			user = User.find_by(login: params[:login])
			if user and user.password_valid?(params[:password]) then
				session[:id] = user.id
				session[:name] = user.first_name + " " + user.last_name
				redirect_to("/photos/index/"+user.id.to_s)
			else
				@error_message = "Invalid username or password. "
				render("/users/login")
			end
		else
			render("/users/login")
		end
	end

	def logout
		reset_session
		redirect_to("/users/login")
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		if request.post? then
			@user.first_name = params[:user][:first_name]
			@user.last_name = params[:user][:last_name]
			@user.login = params[:user][:login]
			@user.password = params[:user][:password]
			@user.password_confirmation = params[:user][:password_confirmation]
			if @user.save then
				redirect_to("/users/login")
			else
				@error_message = "System Error"
				render("/users/new")
			end
		else
			render("/users/new")
		end
	end
end
