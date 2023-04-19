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

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "comics", default: 0
    t.integer "follows", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "thumbail"
    t.integer "status", default: 1
    t.integer "views", default: 0
    t.integer "reports", default: 0
    t.integer "comic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "thumbail"
    t.integer "status", default: 1
    t.integer "views", default: 0
    t.integer "comments", default: 0
    t.integer "reports", default: 0
    t.integer "chapters", default: 0
    t.integer "followers", default: 0
    t.integer "author"
    t.text "anotion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comics_categories", force: :cascade do |t|
    t.integer "comic_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "likes", default: 0
    t.integer "user_id"
    t.integer "reply_id"
    t.integer "comic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comic_id"
  end

  create_table "images", force: :cascade do |t|
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.text "content"
    t.text "url"
    t.integer "status", default: 1
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.integer "chapter_id"
    t.integer "image_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "status", default: 1
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chapters", "comics"
  add_foreign_key "comics", "users", column: "author"
  add_foreign_key "comics_categories", "categories"
  add_foreign_key "comics_categories", "comics"
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
