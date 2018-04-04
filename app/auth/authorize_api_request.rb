class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    # check if admin/user is in the database
    # memoize admin/user object
    @user ||= Admin.find(decoded_auth_token[:admin_id]) if decoded_auth_token[:admin_id]
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token[:user_id]
    return @user
    # handle user not found
  rescue ActiveRecord::RecordNotFound => e
    raise(ExceptionHandler::InvalidToken, ("#{Message.invalid_token} #{e.message}"))
  end

  # decode authentication token
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # check for token in `Authorization` header
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
      raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
