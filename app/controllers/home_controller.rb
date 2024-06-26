# The HomeController class is responsible for home page actions
class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @initial_delivery_time = calculate_updated_delivery_time  
    @resource = User.new
    @devise_mapping = Devise.mappings[:user]




    if user_signed_in?
      @cart = current_user.cart || Cart.create!(user_id: current_user.id)
      else
      session[:cart] ||= {}
    end
  end

  def profile
    # add logic here if needed
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
