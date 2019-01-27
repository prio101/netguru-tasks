class MovieSerializer
  attr_reader :movies

  def initialize(movies)
    @movies = movies
  end

  def serialize
    array = []
    movies.each do |movie|
      array << {
        id: movie.id,
        title: movie.title,
        genre: genre_hash(movie)
      }
    end
    array
  end

  def genre_hash(movie)
    {
      id: movie.genre_id,
      name: movie.genre.name,
      total_movies: Genre.find(movie.genre_id).movies.count
    }
  end
end