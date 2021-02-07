class UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  def create
    if user_params[:password_confirmation]
      user = User.create!(user_params)
      session[:user_id] = user.id
      response = { message: Message.account_created }
      json_response(response, :created)
    else
      response = { message: Message.password_confirmation_missing}
      json_response(response, :not_acceptable)
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
