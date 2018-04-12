class PostsController < ApplicationController

  before_action :super_admin?
	before_action :find_post, only: [ :show, :delete, :validate_post, :decline_post ]

	def index
		posts = Article.all
		render json: posts, status: :ok
	end

	def show
		render json: @post, status: :ok
	end
	
	def delete
		@post.destroy
		head :no_content
	end

	def validate_post
		@post.update(status: "accepted")
		render json: { message: "Artikel telah divalidasi." }		
	end

	def decline_post
		message = @post.article_message.new(post_params)
		if message.save
			@post.update(status: "declined")
			render json: { message: "Artikel telah ditolak." }		
		else
      render json: { message: message.errors }, status: :unprocessable_entity			
		end
	end

	private

	def post_params
		params.require(:post).permit(:message)
	end

	def find_post
		@post = Article.find(params[:id])
	end

end
