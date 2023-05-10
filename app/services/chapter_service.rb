class ChapterService < Service
  def get_chapters(comic_id)
    chapters = Chapter.where(comic_id: comic_id)
  end
end
