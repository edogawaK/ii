class Api::AuthController < ApplicationController
  def signin
    validate_signin_params
    @data = auth_service.signin(params[:username], params[:password])
    respond
  end

  def signup
    @status_code = 201
    @data = auth_service.signup(params[:username], params[:password])
    respond
  end

  private

  def auth_service
    @auth_service ||= AuthService.new
  end

  def validate_signin_params
    # signin_params = params.permit(:username, :password)
    username = params[:username]
    password = params[:username]

    username.is_a?(String) && username.length < 255 || raise(StandardError, "Username is invalid")
    password.is_a?(String) && username.length < 255 || raise(StandardError, "Password is invalid")
  end
end
