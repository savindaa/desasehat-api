class ArticlesController < ApplicationController

  # super admin or admin edukasi only
  before_action :auth_admin_edukasi, only: [ :update, :destroy ]
  before_action :admin_edukasi_only, only: :create
  # find record before action is executed
  before_action :find_article, only: [ :show, :update, :destroy ]
  # index and show doesn't need to login
  skip_before_action :authorize_request, only: [ :index, :show ]

  # return a list of all articles
  # GET /edukasi
  def index
    articles = Article.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: articles.as_json(only: [ :id, :title, :picture, :created_at ]), status: :ok 
  end

  # return detail of an article record
  # GET /edukasi/:id
  def show
    render json: @article, fields: [:id, :title, :picture, :content, :created_at, :created_by]
  end

  # create a new article record
  # POST /edukasi
  def create
    article = Article.new(article_params)
    article.admin_id = @current_user.admin_id
     if article.save
       render json: article, status: :created
    else
       render json: { errors: article.errors }, status: :unprocessable_entity
    end
  end

  # update article attribute
  # PUT /edukasi/:id
  def update
    @article.update(article_params)
    head :no_content
  end

  # delete article record
  # DELETE /edukasi/:id
  def destroy
    @article.destroy
    head :no_content
  end

  private

  # escape strong parameter
  def article_params
    params.require(:article).permit(:title, :content, :picture)
  end

  # find article record based on :id parameter
  def find_article
    @article = Article.find(params[:id])
  end

  def admin_edukasi_only
    unless @current_user.role == "admin_edukasi"
    raise ExceptionHandler::AuthenticationError, Message.unauthorized
    end
  end

end
