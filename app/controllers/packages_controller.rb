class PackagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end
  def checkout 
  	session[:package] = params[:package]
  	session[:price] = params[:price]
  	redirect_to action: "cart"
  end
  def cart  	
  end
  def purchase
  	
  end
end
