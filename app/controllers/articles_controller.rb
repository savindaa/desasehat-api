class ArticlesController < ApplicationController

  # find record before action is executed
  before_action :find_article, only: [ :update, :destroy ]

  # return a list of all articles
  # GET /edukasi
  def index
    articles = Article.select(:id, :title, :picture, :created_at).paginate(:page => params[:page], :per_page => 10) 
    render json: articles, status: :ok
  end

  # return detail of an article record
  # GET /edukasi/:id
  def show
    article = Article.find(params[:id])
    render json: article, status: :ok
  end

  # create a new article record
  # POST /edukasi
  def create
    article = Article.new(article_params)
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
    params.require(:article).permit(:title, :content, :picture, :admin_id)
  end

  # find article record based on :id parameter
  def find_article
    @article = Article.find(params[:id])
  end

end
