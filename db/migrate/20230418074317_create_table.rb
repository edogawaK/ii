class CreateTable < ActiveRecord::Migration[7.0]
  def change
    create_table(:users, id: :string) do |t|
      t.string :username, index: { unique: true }
      t.string :password
      t.integer :status, default: 1
      t.string :role_id
      t.timestamps
    end

    create_table(:roles, id: :string) do |t|
      t.string :name
      t.string :right
      t.integer :status, default: 1
      t.timestamps
    end

    create_table(:notifications, id: :string) do |t|
      t.text :content
      t.text :url
      t.integer :status, default: 1
      t.string :user_id
      t.timestamps
    end

    create_table(:follows, id: :string) do |t|
      t.string :user_id
      t.string :comic_id
    end

    create_table(:comics, id: :string) do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :thumbail
      t.integer :status, default: 1
      t.integer :views, default: 0
      t.integer :comments, default: 0
      t.integer :reports, default: 0
      t.integer :chapters, default: 0
      t.integer :followers, default: 0
      t.string :author, null: true
      t.text :anotion, null: true
      t.timestamps
    end

    create_table(:chapters, id: :string) do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :thumbail
      t.integer :status, default: 1
      t.integer :views, default: 0
      t.integer :reports, default: 0
      t.string :comic_id
      t.timestamps
    end

    create_table(:genres, id: :string) do |t|
      t.string :slug
      t.string :name
      t.integer :status, default: 0
      t.integer :comics, default: 0
      t.integer :follows, default: 0
      t.timestamps
    end

    create_table(:comments, id: :string) do |t|
      t.text :content
      t.integer :likes, default: 0
      t.string :user_id
      t.string :reply_id
      t.string :comic_id
      t.timestamps
    end

    create_table(:comics_genres, primary_key: [:comic_id, :genre_id]) do |t|
      t.string :comic_id
      t.string :genre_id
    end

    create_table(:pages) do |t|
      t.string :chapter_id
      t.string :url
      t.integer :order
      t.timestamps
    end
  end
end
