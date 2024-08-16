class PagesController < ApplicationController
  def home
    @popular_movies = Movie.order(rating: :desc).limit(10)
    @popular_tv_shows = TvShow.order(rating: :desc).limit(10)
  end
end
