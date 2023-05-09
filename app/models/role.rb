class Role < ApplicationRecord
  has_many :users, class_name: "User", foreign_key: "role_id"

  enum right: {
    root: 0,
    admin: 1,
    user: 2,
  }
end
