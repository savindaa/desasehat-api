class ApiController < ApplicationController::API

  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request

  attr_reader :current_user

  def super_admin?
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) unless @current_user.class == Admin
	end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

end
