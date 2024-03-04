class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add_to_cart, :increment_cart_quantity, :decrement_cart_quantity]
  before_action :authenticate_user!

  def show
    @products_in_cart = @cart.cart_products.includes(:product)
    @products_in_cart = CartProduct.all
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    @cart_product = @cart.cart_products.find_or_create_by(product: @product)
    @cart_product.increment!(:quantity)

    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Item added to cart' }
      format.js
    end
  end

  def increment_cart_quantity
    @product = Product.find(params[:id])
    @cart_product = @cart.cart_products.find_or_create_by(product: @product)

    @cart_product.increment!(:quantity)
    @cart_product.reload
    render 'add_to_cart'
  end

  def decrement_cart_quantity
    @product = Product.find(params[:id])
    @cart_product = @cart.cart_products.find_by(product_id: @product.id)
  
    if @cart_product.quantity > 1
      @cart_product.decrement(:quantity)
      @cart_product.save
    else
      @cart_product.destroy
    end
  
    render 'add_to_cart' 
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.build_cart
  end
end
