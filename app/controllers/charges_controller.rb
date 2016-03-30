class ChargesController < ApplicationController
	def new
		@user = User.find(session[:user_id])
	end

	def create
 		 @amount = "#{session[:price]}00"
		customer = Stripe::Customer.create(
		    :email => params[:stripeEmail],
		    :source  => params[:stripeToken]
	 	)
	  	charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'usd'
		)
		if User.find(session[:user_id]).update(package: session[:package])
				redirect_to "/users/" + session[:user_id].to_s
		else
			redirect_to :back
		end

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
	end
end
