class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies_by_genre = {}

    Genre.all.each do |genre|
      movies = @movies_by_genre[genre.name] = Movie.joins(:genres).where(genres: { name: genre.name }).limit(15)
      @movies_by_genre[genre.name] = movies
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def action_movies
    @action_movies = Movie.joins(:genres).where(genres: { name: 'Action' })
  end
end
