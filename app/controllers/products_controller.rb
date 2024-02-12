class ProductsController < ApplicationController
    before_action :set_product, only: [:show] # Ensure set_product is called only for the 'show' action
  
    def index
      # Your index action code here
    end
  
    def show
      @product = Product.find(params[:id])
    end

    def all
      @products = Product.all.paginate(page: params[:page], per_page: 30)
    end
  
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  end
  