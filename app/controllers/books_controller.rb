class BooksController < ApplicationController

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      # redirect_to @book
      # redirect_back(fallback_location: root_path)
      redirect_to :back
    else
      render 'edit'
      # render :edit
      # render template: 'people/index'
    end
  end

  def index
    @books = Book.first(10)
    flash[:alert] = "Your book was not found"
  end


  def show
    @book = Book.find(params[:id])
    # if @book.special?
    #   render "show" and return
    # end
    # render  "product_layout"
    # redirect_to action: :index
    if @book.nil?
      @books = Book.all
      flash.now[:alert] = "Your book was not found"
      render "index"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :summary, :content,:published_at)
  end
end
