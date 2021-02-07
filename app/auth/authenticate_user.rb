class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end

  private

  attr_reader :email, :password

end
