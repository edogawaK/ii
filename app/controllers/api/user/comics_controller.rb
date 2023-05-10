class Api::User::ComicsController < ApplicationController
  def initialize()
    @comic_service = ComicService.new
  end

  def index
    @comic_service.record_per_query = 2

    comics = @comic_service.get_comics
    respond(data: ComicSerializer.serialize(comics))
  end

  def show
    comic = @comic_service.get_comic_details(params[:id])
    respond(data: DetailComicSerializer.serialize(comic))
  end
end
