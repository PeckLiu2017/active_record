class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.role_id = params[:role_id]
    if @client.save
      redirect_to clients_path
    else
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
  end
  
  private
  def client_params
    params.require(:client).permit(:name, :telephone)
  end
end
