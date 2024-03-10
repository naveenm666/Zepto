class CartsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :add_to_cart, :increment_cart_quantity, :decrement_cart_quantity]
  before_action :set_cart, only: [:show, :index, :add_to_cart, :increment_cart_quantity, :decrement_cart_quantity]

  def index
    if user_signed_in?
      @cart = current_user.cart || Cart.create!(user_id: current_user.id)
      if @cart.cart_products.empty?
        # If the cart is empty, set @products_in_cart to nil
        @products_in_cart = nil
      else
        # If the cart is not empty, load the cart products
        @products_in_cart = @cart.cart_products.includes(:product)
      end
    else
      # Handle session cart for guest users (if needed)
      @cart_products = session[:cart] || {}
    end
  end

  def show
    # Assuming current_user.cart.products returns the collection of products in the user's cart
  end

  

  def add_to_cart
    if user_signed_in?
      @product = Product.find(params[:product_id])
      @cart_product = @cart.cart_products.find_or_create_by(product: @product)
      @cart_product.increment!(:quantity)

      @quantity = @cart_product.quantity
    else
      @product = Product.find(params[:product_id])
      session[:cart] ||= {}
      session[:cart][@product.id] ||= 0
      session[:cart][@product.id] += 1
      @quantity = session[:cart][@product.id]
    end

    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Item added to cart' }
      format.js
    end
  end

  def increment_cart_quantity
    if user_signed_in?
      @product = Product.find(params[:id])
      @cart_product = @cart.cart_products.find_or_create_by(product: @product)
      @cart_product.increment!(:quantity)
      @quantity = @cart_product.quantity
      @cart_product.reload
    else
      @product = Product.find(params[:id])
      session[:cart] ||= {}
      session[:cart][@product.id] ||= 0
      session[:cart][@product.id] += 1
      @quantity = session[:cart][@product.id]
    end
    
  end
  

  def decrement_cart_quantity
    if user_signed_in?
      @product = Product.find(params[:id])
      @cart_product = @cart.cart_products.find_by(product_id: @product.id)
    
      if @cart_product.quantity > 1
        @cart_product.decrement(:quantity)
        @quantity = @cart_product.quantity

        @cart_product.save
      else
        @cart_product.destroy
      end
    
      render 'add_to_cart'
    else
      @product = Product.find(params[:id])
      session[:cart] ||= {}
      session[:cart][@product.id] ||= 0
      if session[:cart][@product.id] > 0
        session[:cart][@product.id] -= 1
        @quantity = session[:cart][@product.id]
      else
        @quantity = 0
      end
     render 'add_to_cart'
    end
  end
  private

  def set_cart
    if user_signed_in?
      @cart = current_user.cart || Cart.create!(user_id: current_user.id)    else
      session[:cart] ||= {}
    end
  end
end
