class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :replies, class_name: "Comment", foreign_key: "reply_id"
  belongs_to :comic
end
