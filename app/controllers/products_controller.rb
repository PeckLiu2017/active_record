class ProductsController < ApplicationController
  # layout 'product_layout'
  # layout :product_layout
  # controller.request.xhr? => ajax request
  layout Proc.new { |controller| controller.request.xhr? ? "special_layout" : "product_layout" }

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
    # render body: "#{@products}"
    # render layout: false
  end

  def show
    @product = Product.find(params[:id])
    # render html: "<strong>Not Found Test</strong>".html_safe
    # render json: @product
    # render xml: @product # test failed
    # This XML file does not appear to have any style information associated with it. The document tree is shown below.
    # render file: "/Users/peckliu/Ruby project/active_record/app/views/products/show.html.erb", content_type: "application/xml"
    # render layout: "special_layout"
    # render json: @product, location: product_url(@product)
    # render :xml => { :error => 'Not found' }, :status => 404
    render :xml => { :name => @product.name }
    # render formats: :xml # Missing template？
  end

  def search
    @products = Product.where("name LIKE ?", params[:q] ).limit(5)
  end

  private
  def product_params
    params.require(:product).permit(:name)
  end

  # def product_layout
  #   nil.blank? ? 'special_layout' : 'product_layout'
  # end
end
