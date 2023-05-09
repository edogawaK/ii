class Comic < ApplicationRecord
  has_many :chapters, class_name: "Chapter", foreign_key: "comic_id"
  has_and_belongs_to_many :genres, join_table: "comics_genres", foreign_key: "comic_id"
  has_and_belongs_to_many :followers, class_name: "User", join_table: "follows", foreign_key: "comic_id", association_foreign_key: "user_id"
end
