class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # wrap_parameters :order, include: [:product]
  # GET /orders
  # GET /orders.json
  def index
    @client = Client.find(params[:client_id])
    @orders = @client.orders.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @client = Client.find(params[:client_id])
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @client = Client.find(params[:client_id])
    @order = Order.new(order_params)
    @order.client = @client

    respond_to do |format|
      if @order.save
        format.html { redirect_to [@client, @order], notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: client_order_path(@client, @order) }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to client_order_path(@client, @order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to client_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @client = Client.find(params[:client_id])
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:product)
    end
end
