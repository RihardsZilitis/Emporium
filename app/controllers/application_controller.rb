class ApplicationController < ActionController::Base
	helper :all # include all helpers, all the time
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :only => [:create, :update, :destroy]
  private
def initialize_cart
if session[:cart_id] and Cart.exists?(session[:cart_id])
@cart = Cart.find(session[:cart_id])
else
@cart = Cart.create
session[:cart_id] = @cart.id
end
end
end
