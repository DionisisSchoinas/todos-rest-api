class AuthenticationController < ApplicationController
  skip_before_action :authorize_request

  # return auth token once user is authenticated
  def authenticate
    user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).user

    session[:user_id] = user.id
    session[:expiration_time] = Time.now + 6*60*60 # 6 hours until expiration

    response = { message: Message.logged_in_successfully }
    json_response(response)
  end

  def logout
    session.delete(:user_id)
    head :no_content
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
