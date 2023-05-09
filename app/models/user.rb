class User < ApplicationRecord
  validates :username, :password, presence: true

  has_one :role, class_name: "Role", foreign_key: "role_id"
end
