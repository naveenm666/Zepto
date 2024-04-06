# app/controllers/addresses_controller.rb
class AddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @addresses = current_user.addresses
    
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    
    if @address.save
      redirect_to carts_path
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit( :user_id, :current_location, :house_no, :block_no, :landmark, :address_type)

  end

end
