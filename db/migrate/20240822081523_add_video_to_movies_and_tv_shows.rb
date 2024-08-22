class AddVideoToMoviesAndTvShows < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :video_key, :string
    add_column :tv_shows, :video_key, :string
  end
end
