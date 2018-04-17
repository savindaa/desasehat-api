class ProfileController < ApplicationController

  skip_before_action :authorize_request
  before_action :find_user

  def show
    render json: @user, status: :ok
  end
  
  def update
    @user.update!(user_params)
    head :no_content
  end
  
  def privileges
    render json: @user.privileges, status: :ok
  end

  private 

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:profile).permit(:name, :bio, :address, :picture)
  end

end
