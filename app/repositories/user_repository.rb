class UserRepository
  def create(params)
    params[:password] = Utils.hash(params[:password])
    User.create!(params)
  end

  def find(params)
    unless params.is_a?(Hash)
      params = { id: params }
    end
    User.find_by(params)
  end
end
