# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require './app/services/tmdb_client'

tmdb_client = TmdbClient.new

number_of_pages = 10

puts 'Clearing existing movie data...'
Movie.destroy_all
Genre.destroy_all
Season.destroy_all
Episode.destroy_all
puts 'Existing movie data cleared.'
puts 'Seeding movies...'

(1..number_of_pages).each do |page|
  movies_data = tmdb_client.fetch_popular_movies(page)
  movies_data['results'].each do |movie|

    details = tmdb_client.fetch_movie_details(movie['id'])
    credits = tmdb_client.fetch_movie_credits(movie['id'])

    genres = details['genres'].map do |genre_data|
      Genre.find_or_create_by(name: genre_data['name'])
    end

    movie_record = Movie.find_or_create_by(tmdb_id: movie['id']) do |m|
      m.title = movie['title']
      m.overview = movie['overview']
      m.release_date = movie['release_date']
      m.poster_path = movie['poster_path']
      m.duration = details['runtime']
      m.rating = details['vote_average']
      m.cast = credits['cast'].map { |c| c['name'] }.take(5).join(', ')
      m.category = genres.map(&:name).join(', ')
      m.video_key = "anime.mp4"
    end

    movie_record.genres = genres
    puts movie_record.title
  end
end

puts "Seeding TV Shows..."
(1..number_of_pages).each do |page|
  tv_shows_data = tmdb_client.fetch_popular_tv_shows(page)

  tv_shows_data['results'].each do |tv_show|
    details = tmdb_client.fetch_tv_show_details(tv_show['id'])
    credits = tmdb_client.fetch_tv_show_credits(tv_show['id'])

    genres = details['genres'].map do |genre_data|
      Genre.find_or_create_by(name: genre_data['name'])
    end

    tv_show_record = TvShow.find_or_create_by(tmdb_id: tv_show['id']) do |tv|
      tv.title = tv_show['name']
      tv.overview = tv_show['overview']
      tv.release_date = tv_show['first_air_date']
      tv.poster_path = tv_show['poster_path']
      tv.duration = details['episode_run_time'].first
      tv.rating = details['vote_average']
      tv.cast = credits['cast'].map { |c| c['name'] }.take(5).join(', ')
      tv.category = genres.map(&:name).join(', ')
      tv.video_key = "anime.mp4"
    end
    
    tv_show_record.genres = genres
    puts tv_show_record.title
  end
end

puts 'Seeding complete!'
