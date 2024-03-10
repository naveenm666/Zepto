class SubcategoriesController < ApplicationController
  def products
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
    # respond_to do |format|
    #   format.html
    #   format.js # Render a JavaScript response (products.js.erb)
    # end
    # render 'products.js.erb'


    if user_signed_in?
      @cart = current_user.cart || Cart.create!(user_id: current_user.id)
      else
      session[:cart] ||= {}
    end
  end

end
