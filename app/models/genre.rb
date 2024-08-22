class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  has_many :tv_show_genres
  has_many :tv_shows, through: :tv_show_genres
end
