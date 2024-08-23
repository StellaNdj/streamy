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

  def genre_movies
    genre_name = params[:genre]
    @genre = Genre.find_by(name: genre_name)
    @movies = @genre ? @genre.movies : []
  end
end
