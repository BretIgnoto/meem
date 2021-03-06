class UsersController < ApplicationController
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
		reset_session
		redirect_to :root
	end
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = User.last.id
			redirect_to "/charges/new"		
		else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
	end
	def update
		if User.find(params[:id]).update(user_params)
			flash[:errors] = ["Successfully Update Profile"]
			redirect_to "/charges/new"
		else
			redirect_to :back
		end
	end
	def show
		@user = User.find(session[:user_id])
	end
	def chat
		Chat.create(link:params[:link], user_id:params[:user])
		redirect_to :back
	end
	def destroy
		Chat.find(params[:id]).destroy
		redirect_to :back		
	end
	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
