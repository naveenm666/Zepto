class ProductsController < ApplicationController
    before_action :set_product, only: [:show] # Ensure set_product is called only for the 'show' action
    before_action :authenticate_user!, only: [:show]

    def index
      @subcategories = Subcategory.all
      @products = Product.all
    end
  
    def show
      @product = Product.find(params[:id])
      @cart = current_user.cart || current_user.build_cart

    end

    def all
      @products = Product.all.page(params[:page]).per(30)
    end


  
    
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  end
  