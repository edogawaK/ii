class Genre < ApplicationRecord
  validates :slug, :name, presence: true
end
