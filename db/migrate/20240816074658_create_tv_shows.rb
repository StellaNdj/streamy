class CreateTvShows < ActiveRecord::Migration[7.1]
  def change
    create_table :tv_shows do |t|
      t.string :title
      t.text :overview
      t.date :release_date
      t.integer :tmdb_id
      t.string :poster_path
      t.string :cast
      t.float :rating
      t.integer :duration
      t.string :category

      t.timestamps
    end
  end
end
