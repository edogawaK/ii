class Genre < ApplicationRecord
  validates :slug, :name, presence: true

  has_many :comics, class_name: "Comic", foreign_key: "genre_id"
end
