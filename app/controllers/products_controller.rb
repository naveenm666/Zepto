class ProductsController < ApplicationController
    before_action :set_product, only: [:show] # Ensure set_product is called only for the 'show' action
  
    def index
      # Your index action code here
    end
  
    def show
      # This action will handle displaying an individual product's details
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  end
  