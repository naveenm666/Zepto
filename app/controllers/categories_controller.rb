class CategoriesController < ApplicationController
 
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end

  def all
    @categories = Category.all.paginate(page: params[:page], per_page: 30)
  end


end
