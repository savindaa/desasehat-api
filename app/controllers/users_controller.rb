class UsersController < ApplicationController

  before_action :super_admin?
	before_action :find_user, only: [ :show, :destroy ]

	def index
		users = User.all
		render json: users, status: :ok
	end

	def show
		render json: @user, status: :ok
	end
	
	def destroy
		@user.destroy
		head :no_content
	end

	private

	def find_user
		@user = User.find(params[:id])
	end

end
