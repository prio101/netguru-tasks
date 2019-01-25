class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  def index
    @movies = Movie.all.decorate
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def movies_list
    @movies = Movie.select(:id, :title)
    render json: { data: @movies }, status: :ok
  end

  def movie
    @movie = Movie.find(params[:id])
    render json: { data: @movie }, status: :ok
  end

  def movies_list_with_genre
    @movies = Movie.all
    json = MovieSerializer.new(@movies).serialize
    render json: { data: json }, status: :ok
  end

  def send_info
    @movie = Movie.find(params[:id])
    MovieInfoMailer.send_info(current_user, @movie).deliver_now
    redirect_back(fallback_location: root_path, notice: "Email sent with movie info")
  end

  def export
    file_path = "tmp/movies.csv"
    MovieExporter.new.call(current_user, file_path)
    redirect_to root_path, notice: "Movies exported"
  end
end
