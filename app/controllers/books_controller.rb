class BooksController < ApplicationController
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    render js: "alert('delete complete!');"
  end

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
    @book = if !params[:author_id].nil?
      Book.find(params[:id])
    else
      Book.where("id = #{params[:id]}")
      # Book.find_by_sql("SELECT books.* FROM books WHERE id = 1008 AND author_id = 1 ")
    end

    # if @book.special?
    #   render "show" and return
    # end
    # render  "product_layout"

    # redirect_to action: :index

    # if @book.nil?
    #   @books = Book.all
    #   flash.now[:alert] = "Your book was not found"
    #   render "index"
    # end
    # head :bad_request, location: book_path(@book)
  end

  private
  def book_params
    params.require(:book).permit(:title, :summary, :content,:published_at)
  end
end
