class CreateRelations < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :roles
    add_foreign_key :follows, :users
    add_foreign_key :follows, :comics
    add_foreign_key :notifications, :users
    add_foreign_key :comments, :users
    add_foreign_key :comments, :comics
    add_foreign_key :comments, :comments, column: :reply_id
    add_foreign_key :chapters, :comics, column: :comic_id
    add_foreign_key :comics_genres, :comics, column: :comic_id
    add_foreign_key :comics_genres, :genres, column: :genre_id
    add_foreign_key :pages, :chapters
  end
end
