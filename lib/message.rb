class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end

  def self.user_not_found
    'User not found.'
  end

  def self.otp_not_match
    'OTP code does not match.'
  end
end
