class GenresController < ApplicationController
  def index
    @genres = Genre.all.decorate
  end

  def movies
    @genre = Genre.find(params[:id]).decorate
    @response = Resources::MovieResource.new(populate_titles).movie_list_response
  end

  private

  def populate_titles
    Movie.where(genre_id: @genre.id).pluck(:title).uniq!
  end
end
