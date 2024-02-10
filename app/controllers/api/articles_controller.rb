class Api::ArticlesController < ApiController
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    @article = Article.friendly.find(params[:id])
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.permit(:title, :body)
  end
end