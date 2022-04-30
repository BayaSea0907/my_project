
module Admin
  class ArticlesController < Admin::ApplicationController
    before_action :set_article, only: %i[show edit update]

    def index
      # TODO: ページングを行う
      @articles = Article.all
    end

    def show; end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to admin_article_path(@article), notice: '登録に成功しました'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to @article
      else
        render :edit
      end
    end

    def destroy
      if @article.destroy
        redirect_to action: :show, alert: @article.errors.full_messages
      else
        redirect_to action: :index
      end
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:id, :title, :content)
    end
  end
end
