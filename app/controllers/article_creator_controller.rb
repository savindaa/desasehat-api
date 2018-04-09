class ArticleCreatorController < ApplicationController

  before_action :article_creator?

  def create_article
    article = @current_user.articles.new(title: article_params[:title], content: article_params[:content], picture: article_params[:picture])
    article.status = "pending"
    if article.save
      unless article_params[:tags].blank?
        article_params[:tags].map do |tag|
          article.tags << Tag.find(tag[:id])
        end
      end
      render json: article, status: :created
    else
      render json: { message: article.errors }, status: :unprocessable_entity
    end
  end

  def tags_list
    tags = Tag.all
    render json: tags, status: :ok
  end

  def my_articles
    articles = @current_user.articles.paginate(page: params[:page], per_page: params[:limit] || 10).order(updated_at: :desc)
    render json: articles, only: [ :id, :title, :picture, :created_at, :tags, :status ], status: :ok
  end

  private

  def article_params
    params.require(:article_creator).permit(:title, :content, :picture, tags: [:id, :name])
  end

  def article_creator?
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) if @current_user.privileges.find_by(id: 4).blank?
  end

end
