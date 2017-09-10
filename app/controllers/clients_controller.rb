require 'prawn'
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

  def index
    @clients = if params[:status] == 'inactive'
      Client.where('status LIKE ?', params[:status])
    else
      @clients = Client.last(10)
    end
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
      # pdf = Prawn::Document.new
      # pdf.text 'Hello World'
      send_data generate_pdf(@client),
        filename: "#{@client.name}.pdf",
        type: 'application/pdf',
        disposition: 'inline'
      end
    end
  end

  # def client
  #   @client = Client.find(params[:id])
  # end

  # def download_pdf
  #   client = Client.find(params[:id])
  #   # send_data generate_pdf(client),
  #   #           filename: "#{client.name}.pdf",
  #   #           type: "application/pdf"
  #   send_file("#{Rails.root}/public/image.jpg",
  #             filename: "#{client.name}.jpg",
  #             type: "application/jpeg")
  # end

  private
  def client_params
    params.require(:client).permit(:name, :telephone)
  end

  def generate_pdf(client)
    Prawn::Document.new do
      text client.name, align: :center
      text "Name: #{client.name}"
      text "Telephone: #{client.telephone}"
    end.render
  end
end
