class SubcategoriesController < ApplicationController
  def products
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
    # respond_to do |format|
    #   format.html
    #   format.js # Render a JavaScript response (products.js.erb)
    # end
    # render 'products.js.erb'
  end

end
