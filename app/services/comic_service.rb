class ComicService < Service
  def get_comics
    Comic.limit(@record_per_query).offset(@offset)
  end

  def get_comic(id)
    Comic.find(id)
  end

  def get_comic_details(id)
    Comic.includes(:chapters).find(id)
  end

  def update_comic(id)
  end

  private

  def serialize_response_get_comic_details(comic)
    comic.as_json(include: {
                    chapters: {
                      except: [:created_at, :updated_at],
                    },
                  })
  end
end
