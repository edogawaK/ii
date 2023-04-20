class UserResource
  def to_json(user, options = { context: :default })
    context = options[:context]

    handle_resource = strategy[context]
    if (handle_resource.nil?)
      handle_resource = strategy[:default]
    end

    handle_resource.call(user)
  end

  private

  def strategy
    {
      default: method(:for_default),
      auth: method(:for_auth),
    }
  end

  def for_default(user)
    {
      username: user.username,
      role_id: user.role_id,
      status: user.status,
    }
  end

  def for_auth(user)
    {
      username: user.username,
      role_id: user.role_id,
    }
  end
end
