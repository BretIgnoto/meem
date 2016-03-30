class PackagesController < ApplicationController
  def index
  end
  def checkout 
  	session[:package] = params[:package]
  	session[:price] = params[:price]
  	redirect_to action: ""
  end
  def cart  	
  end
  def purchase
  	
  end
end
