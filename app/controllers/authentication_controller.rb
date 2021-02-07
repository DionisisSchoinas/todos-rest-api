class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  def authenticate
    user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).user
    if user
      session[:user_id] = user.id
      response = { message: Message.logged_in_successfully }
      json_response(response)
    else
      head :no_content
    end
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
