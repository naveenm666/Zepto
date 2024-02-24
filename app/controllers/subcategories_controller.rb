class SubcategoriesController < ApplicationController
  def products
    @subcategory = Subcategory.find(params[:id])
    @products = @subcategory.products
    respond_to do |format|
      format.js # Render a JavaScript response (products.js.erb)
    end
  end

end
