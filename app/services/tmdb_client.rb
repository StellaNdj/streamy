require 'net/http'
require 'json'

class TmdbClient
  API_BASE_URL = 'https://api.themoviedb.org/3'

  def initialize
    @api_key = ENV['TMDB_API_KEY']
  end

  def fetch_popular_movies(page)
    endpoint = '/movie/popular'
    params = { api_key: @api_key, page: page }
    request(endpoint, params)
  end

  def fetch_popular_tv_shows(page)
    endpoint = '/tv/popular'
    params = { api_key: @api_key, page: page }
    request(endpoint, params)
  end

  def fetch_movie_credits(movie_id)
    endpoint = "/movie/#{movie_id}/credits"
    params = { api_key: @api_key }
    request(endpoint, params)
  end

  def fetch_tv_show_credits(tv_show_id)
    endpoint = "/tv/#{tv_show_id}/credits"
    params = { api_key: @api_key }
    request(endpoint, params)
  end

  def fetch_movie_details(movie_id)
    endpoint = "/movie/#{movie_id}"
    params = { api_key: @api_key }
    request(endpoint, params)
  end

  def fetch_tv_show_details(tv_show_id)
    endpoint = "/tv/#{tv_show_id}"
    params = { api_key: @api_key }
    request(endpoint, params)
  end

  private

  def request(endpoint, params)
    uri = URI("#{API_BASE_URL}#{endpoint}")
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get(uri)

    JSON.parse(response)
  end
end
