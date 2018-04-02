class ApplicationController < ActionController::API
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request

  attr_reader :current_user

  def auth_super_admin
    unless role == "super_admin"
    raise ExceptionHandler::AuthenticationError, Message.unauthorized
    end
  end

  def auth_aparat_desa
    unless role == "super_admin" || role == "aparat_desa"
    raise ExceptionHandler::AuthenticationError, Message.unauthorized
    end
  end

  def auth_admin_edukasi
    unless role == "admin_edukasi"
    raise ExceptionHandler::AuthenticationError, Message.unauthorized
    end
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def role
    @current_user.role
  end

end
