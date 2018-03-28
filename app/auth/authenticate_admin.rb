class AuthenticateAdmin
  def initialize(username, password)
    @username = username
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(admin_id: admin.id) if user
  end

  private

  attr_reader :username, :password

  # verify user credentials
  def admin
    admin = Admin.find_by(username: username)
    return admin if admin && admin.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
