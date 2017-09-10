class WelcomesController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    100.times {
      response.stream.write "hello world\n"
      sleep 1
    }
  ensure
    response.stream.close
  end

  def show_sentences
    response.headers['Content-Type'] = 'text/event-stream'
    # @book = Book.find(params[:id])
    Array(params[:ids]).each do |book_id|
      book = Book.find(book_id)
      response.stream.write book.summary + "\n"
      sleep 1
    end


    # @books = Book.find(5)
    # @books.each do |book|
    #   response.stream.write book.summary + "\n"
    #   sleep 1
    # end
  ensure
    response.stream.close
  end
end
