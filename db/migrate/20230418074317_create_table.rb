class CreateTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password
      t.integer :status, default: 1
      t.integer :role_id, null: true
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.integer :status, default: 1
      t.timestamps
    end

    create_table :notifications do |t|
      t.text :content
      t.text :url
      t.integer :status, default: 1
      t.integer :user_id
      t.timestamps
    end

    create_table :follows do |t|
      t.integer :user_id
      t.integer :comic_id
    end

    create_table :comics do |t|
      t.string :name
      t.text :description
      t.text :thumbail
      t.integer :status, default: 1
      t.integer :views, default: 0
      t.integer :comments, default: 0
      t.integer :reports, default: 0
      t.integer :chapters, default: 0
      t.integer :followers, default: 0
      t.integer :author
      t.text :anotion, null: true
      t.timestamps
    end

    create_table :chapters do |t|
      t.string :name
      t.text :description
      t.text :thumbail
      t.integer :status, default: 1
      t.integer :views, default: 0
      t.integer :reports, default: 0
      t.integer :comic_id
      t.timestamps
    end

    create_table :images do |t|
      t.text :url
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :comics, default: 0
      t.integer :follows, default: 0
      t.timestamps
    end

    create_table :comments do |t|
      t.text :content
      t.integer :likes, default: 0
      t.integer :user_id
      t.integer :reply_id
      t.integer :comic_id
      t.timestamps
    end

    create_table :comics_categories do |t|
      t.integer :comic_id
      t.integer :category_id
      t.timestamps
    end

    create_table :pages do |t|
      t.integer :chapter_id
      t.integer :image_id
      t.integer :order
      t.timestamps
    end
  end
end
