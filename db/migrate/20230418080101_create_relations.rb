class CreateRelations < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :roles
    add_foreign_key :follows, :users
    add_foreign_key :follows, :comics
    add_foreign_key :notifications, :users
    add_foreign_key :comments, :users
    add_foreign_key :comments, :comics
    add_foreign_key :comments, :comments, column: :reply_id
    add_foreign_key :comics, :users, column: :author
    add_foreign_key :chapters, :comics
    add_foreign_key :comics_categories, :comics
    
    add_foreign_key :comics_categories, :categories
    add_foreign_key :pages, :chapters
    add_foreign_key :pages, :images
  end
end
