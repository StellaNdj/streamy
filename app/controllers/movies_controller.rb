class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @action_movies = Movie.genre(find_by(name: 'Action'))
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
