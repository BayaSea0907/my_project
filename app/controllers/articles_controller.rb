class ArticlesController < ApplicationController
  def index
    # TODO: ページングする
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
    search_query = params.require(:query)
    @articles = Article.search(search_query)
  end
end
