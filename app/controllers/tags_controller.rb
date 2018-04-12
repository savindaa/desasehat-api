class TagsController < ApplicationController

  before_action :super_admin?
  before_action :find_tag, only: [ :show, :update, :delete ]

  def index
    tags = Tag.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: tags, status: :ok
  end

  def show
    render json: @tag, status: :ok
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: tag, status: :created
    else
      render json: { message: tag.errors }, status: :unprocessable_entity
    end
  end

  def update
    @tag.update!(tag_params)
    head :no_content
  end

  def destroy
    @tag.destroy!
    head :no_content
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
 end

end
