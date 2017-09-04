class AddressesController < ApplicationController
  def new
    @address = Address.new(client_id: 4)
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
  def address_params
    params.require(:address).permit(:country, :province, :client_id)
  end
end
