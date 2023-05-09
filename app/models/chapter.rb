class Chapter < ApplicationRecord
  belongs_to :comic
  has_many :pages
end
