class ChaptersController < ApplicationController
  def index
    comic = Comic.find(params[:comic_id])
    respond(data: comic)
  end

  private

  def validate_for_index
  end
end
