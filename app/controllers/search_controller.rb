class SearchController < ApplicationController
  def index
    @movies = Movie.search(params[:query])
    @tv_shows = TvShow.search(params[:query])

    respond_to do |format|
      format.html
      format.json { render json: { movies: @movies, tv_shows: @tv_shows } }
    end
  end

  def show_all
    @movies = Movie.search(params[:query])
    @tv_shows = TvShow.search(params[:query])
  end
end
