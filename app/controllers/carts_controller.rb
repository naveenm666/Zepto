class CartsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :add_to_cart, :increment_cart_quantity, :decrement_cart_quantity]
  before_action :set_cart, only: [:show, :add_to_cart, :increment_cart_quantity, :decrement_cart_quantity]

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

  

  def add_to_cart
    if user_signed_in?
      @product = Product.find(params[:product_id])
      @cart_product = @cart.cart_products.find_or_create_by(product: @product)
      @cart_product.increment!(:quantity)

      @quantity = @cart_product.quantity
    else
          # Find the product
      @product = Product.find(params[:product_id])

      # Ensure the session cart is initialized
      session[:cart] ||= {}

      # Find or create the cart_product for the current product
      session[:cart][@product.id] ||= {}
      session[:cart][@product.id][:quantity] ||= 0
      session[:cart][@product.id][:quantity] += 1

      # Find or create the cart_product for the current product
      cart_product = CartProduct.find_or_create_by(product: @product)

      # Optionally, update the @quantity variable with the new value for display
      @quantity = session[:cart][@product.id][:quantity]

      # Render the appropriate view or template
      render 'add_to_cart'
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
      render 'add_to_cart'
    else
        # Find the product
      @product = Product.find(params[:id])

      # Ensure the session cart is initialized
      session[:cart] ||= {}

      # Find or create the cart_product for the current product
      session[:cart][@product.id] ||= {}
      session[:cart][@product.id][:quantity] ||= 0
      session[:cart][@product.id][:quantity] += 1

      # Find or create the cart_product for the current product
      cart_product = CartProduct.find_or_create_by(product: @product)

      # Increment the quantity of the cart_product
      session[:cart][@product.id][:cart_product] ||= cart_product
      session[:cart][@product.id][:cart_product].quantity ||= 0
      session[:cart][@product.id][:cart_product].quantity += 1

      # Update @quantity with the new value for display
      @quantity = session[:cart][@product.id][:quantity]

      # Render the appropriate view or template
      render 'add_to_cart'
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
      # Find the product
      @product = Product.find(params[:id])

      # Ensure the session cart is initialized
      session[:cart] ||= {}
    
      # Decrement the quantity in the session cart
      session[:cart][@product.id] ||= {}
      session[:cart][@product.id][:quantity] ||= 0
      session[:cart][@product.id][:quantity] -= 1 if session[:cart][@product.id][:quantity] > 0
    
      # Find the cart_product for the current product
      cart_product = CartProduct.find_by(product: @product)
    
      # Ensure that the cart_product exists and its quantity is properly initialized
      if cart_product
        cart_product.quantity ||= 0
    
        # Decrement the quantity of the cart_product
        cart_product.quantity -= 1 if cart_product.quantity > 0
    
        # Save the changes to the cart_product
        cart_product.save
      end
    
      # Update @quantity with the new value for display
      @quantity = session[:cart][@product.id][:quantity]
    
      # Render the appropriate view or template
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
