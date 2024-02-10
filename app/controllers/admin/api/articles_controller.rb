class Admin::Api::ArticlesController < ApiController
  before_action :set_article, only: [:update, :destroy, :show]

  def index
    @articles = Article.all
    @articles = @articles.search_for(params[:search_article]&.strip) if params[:search_article].present?
    @articles = @articles.reorder(params[:sort] || 'created_at desc')
    @articles = @articles.page(params[:admin_page])
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      associate_images(@article)
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      associate_images(@article)
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
