class TvShowsController < ApplicationController
  def index
    @tv_shows = TvShow.all
    @tv_shows_by_genre = {}
    Genre.all.each do |genre|
      tv_shows = @tv_shows_by_genre[genre.name] = TvShow.joins(:genres).where(genres: { name: genre.name }).limit(15)
      @tv_shows_by_genre[genre.name] = tv_shows
    end
  end

  def show
    @tv_show = TvShow.find(params[:id])
  end

  def genre_tv_shows
    genre_name = params[:genre]
    @genre = Genre.find_by(name: genre_name)
    @tv_shows = @genre ? @genre.tv_shows : []
  end
end
