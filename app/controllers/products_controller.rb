class ProductsController < ApplicationController
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render js: "alert('delete complete!');"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      # render 'edit'
      # render :edit
      # render template: 'people/index'
    end
  end

  def index
    @products = Product.first(10)
    # render inline: "<% @products.each do |p| %><p><%= p.name %></p><% end %>"
    # render inline: "xml.p {'Horrid coding practice!'}", type: :builder
    # render plain: "OK"
  end

  def show
    @product = Product.find(params[:id])
    # render html: "<strong>Not Found Test</strong>".html_safe
    # render json: @product
    # render xml: @product # test failed
  end

  private
  def product_params
    params.require(:product).permit(:name)
  end
end
