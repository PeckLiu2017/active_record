class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def index
    @articles = Article.first(10)
  end

  private
  def article_params
    params.require(:article).permit(:title, :summary, :text, :user_id)
  end
end
