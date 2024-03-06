class ProductsController < ApplicationController
    before_action :set_product, only: [:show] # Ensure set_product is called only for the 'show' action

    def index
      @subcategories = Subcategory.all
      @products = Product.all
    end
  
    def show
      @product = Product.find(params[:id])
      if user_signed_in?
        @cart = current_user.cart || current_user.build_cart
      else
        session[:cart] ||= {}
      end

    end

    def all
      @products = Product.all.page(params[:page]).per(30)
    end


  
    
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  end
  