class Api::AuthController < ApplicationController
  def signin
    auth_service.sigin(params)
    @data = params
    respond
  end

  def signup
  end

  private

  def auth_service
    @auth_service ||= AuthService.new
  end

  def signin_params
  end
end
