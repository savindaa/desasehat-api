class ArticleCreatorController < ApiController

  before_action :article_creator?

  def create_article
    article = @current_user.articles.new(article_params.except(:tags))
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
    render json: articles, only: [ :id, :title, :created_at, :tags, :status ], methods: :pictures, status: :ok
  end

  def edit_article
    article = @current_user.articles.find(params[:id])
    # raise error if article already been accepted by Superadmin
    raise(ExceptionHandler::StatementInvalid, Message.article_accepted) if (article.status == "accepted")

    if article.update!(article_params.except(:tags))
      current = []
      unless article_params[:tags].blank?
        article_params[:tags].map do |tag|
          article.tags << Tag.find(tag[:id]) if article.tags.find_by(id: tag[:id]).blank?
          current << tag[:id]
        end
      end
      current_article = article.tags.where.not(id: current)
      current_article.map { |d| article.tags.delete(d.id) } unless current_article.blank?
      head :no_content
    else
      render json: { message: article.errors }, status: :unprocessable_entity
    end
  end

  def delete_article
    @current_user.articles.delete(params[:id])
    render json: { message: "Artikel telah dihapus." }    
  end

  private

  def article_params
    params.require(:article_creator).permit(:title, :content, :picture, tags: [:id, :name])
  end

  def article_creator?
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) if @current_user.privileges.find_by(id: 4).blank?
  end

end
