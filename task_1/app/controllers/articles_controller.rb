class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    # Let's imagine that writing to the database lasts at least 20 seconds :(
    # !!!Don't change this line!!!
    sleep(20)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
