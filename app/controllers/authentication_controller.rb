class AuthenticationController < ApplicationController

  skip_before_action :authorize_request

  # return auth token once user is authenticated
  # POST /admin/login
  def authenticate_admin
    auth_token = AuthenticateAdmin.new(auth_params[:username], auth_params[:password]).call
    render json: { auth_token: auth_token }
  end

  private

  def auth_params
    params.permit(:username, :password)
  end
end
