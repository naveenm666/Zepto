# The HomeController class is responsible for home page actions
class HomeController < ApplicationController
  def index
    @products = Product.all
  end
end
