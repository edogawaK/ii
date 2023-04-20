class AuthService
  def signin(username, password)
    user = user_repo.find({ username: username, password: Utils.hash(password) })
    puts "auth", username, BCrypt::Password.create(password)
    token = encodeJWT({ username: user.username, role_id: user.role_id })
    {
      user: user,
      access_token: token,
    }
  end

  def signup(username, password)
    user = user_repo.create({ username: username, password: password })
  end

  def encodeJWT(payload)
    JWT.encode(payload, AppConfig::JWT_KEY)
  end

  def decodeJWT(token)
    JWT.decode(token, AppConfig::JWT_KEY)
  end

  def is_signin(token)
    begin
      decodeJWT(token)
      true
    rescue
      false
    end
  end

  private

  def user_repo
    @user_repo || @user_repo = UserRepository.new
    @user_repo
  end
end
