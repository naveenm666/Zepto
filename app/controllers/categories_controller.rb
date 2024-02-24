class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
    @products = @category.products
  end

  def all
    @categories = Category.all.page(params[:page]).per(30)

  end
  
end
