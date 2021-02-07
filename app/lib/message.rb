class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.expired
    'Session has expired, please login again'
  end

  def self.account_created
    'Account created successfully, and logged in automatically'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.password_confirmation_missing
    'Password confirmation missing'
  end

  def self.logged_in_successfully
    'Logged in successfully'
  end
end
