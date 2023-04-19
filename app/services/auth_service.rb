require 'jwt'

class AuthService
  def signin(params)
    user_repo.create(params)
    
  end

  private

  def user_repo
    @user_repo || =UserRepository.new
  end
end
