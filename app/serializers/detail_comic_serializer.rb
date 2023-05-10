class DetailComicSerializer < ComicSerializer
  # attributes :chapters

  # def chapters
  #   ChapterSerializer.serialize object.chapters
  # end

  has_many :chapters
end
