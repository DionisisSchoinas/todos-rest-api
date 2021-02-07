class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    #@current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    if session[:user_id]
      if session[:expiration_time] > Time.now
        @current_user ||= User.find_by_id(session[:user_id])
      else
        @current_user = nil
        session.delete(:user_id)
        session.delete(:expiration_time)
        json_response( { messsage: Message.expired }, :unauthorized)
      end
    else
      @current_user = nil
      json_response( { messsage: Message.unauthorized }, :unauthorized)
    end
  end
end
