class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
    @products = @category.products
    if user_signed_in?
      @cart = current_user.cart || current_user.build_cart
    else
      @cart = Cart.new(session[:cart])
    end
  end

  def all
    @categories = Category.all.page(params[:page]).per(30)

  end


end
