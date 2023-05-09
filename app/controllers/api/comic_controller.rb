class Api::ComicController < ApplicationController
  RECORDS_PER_QUERRY = 20

  def get_comics
    # puts "get comics"
    # comics = Comic.limit(RECORDS_PER_QUERRY)
    # @data = comics
    # puts @data
    # # @data = comics.map do |comic|
    # #   comic.serialize(["name"])
    # # end
    # # respond
    # render json: @data
    def get_comics
      comics = Comic.limit(RECORDS_PER_QUERRY)
      @data = comics.as_json(except: [:chapters, :followers])
      render json: @data
    end
  end

  private

  def serialize_comics(comics)
    serialized_comics = []

    comics.each do |comic|
      serialized_comics.push({
        name: comic.name,
        slug: comic.slug,
        description: comic.description,
        thumbail: comic.thumbail,
      })
    end

    serialized_comics
  end
end
