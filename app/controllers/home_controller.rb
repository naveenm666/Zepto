# The HomeController class is responsible for home page actions
class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @initial_delivery_time = calculate_updated_delivery_time  


    if user_signed_in?
      @cart = current_user.cart || current_user.build_cart
    else
      @cart = Cart.new(session[:cart])
    end
  end
  

  def update_delivery_time
    updated_delivery_time = calculate_updated_delivery_time

    render json: { delivery_time: updated_delivery_time }
  end

  private

  def calculate_updated_delivery_time
    
    estimated_time = rand(10..30)
    " #{estimated_time} Mins"
  end
end
