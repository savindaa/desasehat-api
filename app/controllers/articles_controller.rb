class ArticlesController < ApplicationController

  skip_before_action :authorize_request

  # return a list of all articles
  # GET /edukasi
  def list
    articles = Article.where(status: "accepted").paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: articles, only: [ :id, :title, :picture, :created_at, :tags ], methods: :created_by, status: :ok
  end

  # return detail of an article record
  # GET /edukasi/:id
  def detail
    article = Article.find(params[:id])
    render json: article, except: [ :updated_at, :created_by_id ], methods: :created_by, status: :ok
  end

end
