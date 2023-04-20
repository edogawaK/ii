class Utils
  def self.hash(payload)
    salt = AppConfig::BCRYPT_KEY
    BCrypt::Engine.hash_secret(payload, salt, 12)
  end
end
