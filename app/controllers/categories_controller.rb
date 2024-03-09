class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
    @products = @category.products
    if user_signed_in?
      @cart = current_user.cart || Cart.create!(user_id: current_user.id)
      else
      session[:cart] ||= {}
    end
  end

  def all
    @categories = Category.all.page(params[:page]).per(30)

  end


end
