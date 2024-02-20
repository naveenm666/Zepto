class ProductsController < ApplicationController
    before_action :set_product, only: [:show] # Ensure set_product is called only for the 'show' action
  
    def index
      # Your index action code here
    end
  
    def show
      @product = Product.find(params[:id])
    end

    def all
      @products = Product.all.page(params[:page]).per(30)
    end

    def add_to_cart
      @product = Product.find(params[:id])

      session[:cart] = session[:cart] || {}
      session[:cart][@product.id] = { quantity: 1 }
    end

    def increment_cart_quantity
      @product = Product.find(params[:id])
      session[:cart][@product.id][:quantity] += 1
    end

    def decrement_cart_quantity
      @product = Product.find(params[:id])
      session[:cart][@product.id][:quantity] -= 1
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  end
  