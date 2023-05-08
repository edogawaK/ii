# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_18_080101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "thumbail"
    t.integer "status", default: 1
    t.integer "views", default: 0
    t.integer "reports", default: 0
    t.string "comic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comics", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "thumbail"
    t.integer "status", default: 1
    t.integer "views", default: 0
    t.integer "comments", default: 0
    t.integer "reports", default: 0
    t.integer "chapters", default: 0
    t.integer "followers", default: 0
    t.string "author"
    t.text "anotion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comics_genres", primary_key: ["comic_id", "genre_id"], force: :cascade do |t|
    t.string "comic_id", null: false
    t.string "genre_id", null: false
  end

  create_table "comments", id: :string, force: :cascade do |t|
    t.text "content"
    t.integer "likes", default: 0
    t.string "user_id"
    t.string "reply_id"
    t.string "comic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", id: :string, force: :cascade do |t|
    t.string "user_id"
    t.string "comic_id"
  end

  create_table "genres", id: :string, force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.integer "status", default: 0
    t.integer "comics", default: 0
    t.integer "follows", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", id: :string, force: :cascade do |t|
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", id: :string, force: :cascade do |t|
    t.text "content"
    t.text "url"
    t.integer "status", default: 1
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", primary_key: ["chapter_id", "image_id"], force: :cascade do |t|
    t.string "chapter_id", null: false
    t.string "image_id", null: false
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :string, force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "status", default: 1
    t.string "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "chapters", "comics"
  add_foreign_key "comics_genres", "comics"
  add_foreign_key "comics_genres", "genres"
  add_foreign_key "comments", "comics"
  add_foreign_key "comments", "comments", column: "reply_id"
  add_foreign_key "comments", "users"
  add_foreign_key "follows", "comics"
  add_foreign_key "follows", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "pages", "chapters"
  add_foreign_key "pages", "images"
  add_foreign_key "users", "roles"
end
