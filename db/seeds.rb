# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

class Seeder
  def initialize()
    file_comics_content = File.read(Rails.root.join("db", "data", "comics.json"))
    file_chapters_content = File.read(Rails.root.join("db", "data", "chapters.json"))
    file_images_content = File.read(Rails.root.join("db", "data", "images.json"))

    @comics = JSON.parse file_comics_content
    @chapters = JSON.parse file_chapters_content
    @images = JSON.parse file_images_content
    @genres = {}

    @comics.each do |comic|
      comic["genres"].each do |genre|
        @genres[genre["id"]] = genre
      end
    end
  end

  def seed
    seed_admins
    seed_genres
    seed_comics
    seed_chapters
    seed_pages_for_chapters
  end

  def seed_pages_for_chapters
    @images.each do |image|
      orderIndex = 1
      page = Page.create({ url: image["url"], chapter_id: image["chapter_id"], order: orderIndex += 1 })
    end
  end

  def seed_chapters
    @chapters.each do |chapter|
      puts "seed"
      Chapter.create({ id: chapter["id"], name: chapter["name"], slug: chapter["slug"], comic_id: chapter["comicId"] })
    end
  end

  def seed_comics
    @comics.each do |comic|
      comic_entity = Comic.create({ id: comic["id"], name: comic["title"], slug: comic["slug"],
                                    description: comic["description"], thumbail: comic["avt"] })
      seed_genres_for_comic(comic_entity, comic["genres"])
    end
  end

  def seed_genres_for_comic(comic, genres)
    genres.each do |genre|
      genre_entity = Genre.find(genre["id"])
      comic.genres.push(genre_entity)
    end
  end

  def seed_admins
    User.create({ username: "admin", password: "admin" })
  end

  def seed_genres
    @genres.each do |id, genre|
      Genre.create({ slug: genre["slug"], name: genre["title"], id: genre["id"] })
    end
  end
end

Seeder.new.seed
