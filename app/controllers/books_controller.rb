class BooksController < ApplicationController

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
      # render :edit
      # render template: 'people/index'
    end
  end

  def index
    @books = Book.first(10)
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :summary, :content,:published_at)
  end
end
