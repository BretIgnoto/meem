class UserController < ApplicationController
	def index
	end
	def signin
	end
	def login
		user = User.find_by(email:params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/users/" + user.id.to_s
		else
			flash[:errors] = ["Invalid email/password"]
			redirect_to :root
		end
	end
	def logout
		session[:user_id] = nil
		redirect_to :root
	end
	def show
		@user = User.find(session[:user_id])
	end
end
