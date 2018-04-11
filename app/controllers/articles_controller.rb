class ArticlesController < ApplicationController

  skip_before_action :authorize_request, only: [ :list, :detail, :related_article ]
  before_action :find_article, only: [ :detail, :add_bookmark ]

  # return a list of all articles
  # GET /edukasi
  def list
    articles = Article.where(status: "accepted").paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: articles, only: [ :id, :title, :created_at, :tags ], methods: [ :pictures, :created_by ], status: :ok
  end

  # return detail of an article record
  # GET /edukasi/:id
  def detail
    render json: @article, except: [ :updated_at, :created_by_id, :picture ], methods: [ :pictures, :created_by ], status: :ok
  end

  def add_bookmark
    @current_user.bookmarks << @article
    render json: { message: "Bookmark telah ditambahkan." }
  end

  def remove_bookmark
    @current_user.bookmarks.delete(params[:id])
    render json: { message: "Bookmark telah dihapus." }
  end

  def list_bookmark
    articles = @current_user.bookmarks.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: articles, only: [ :id, :title, :created_at, :tags ], methods: [ :pictures, :created_by ], status: :ok
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

end
