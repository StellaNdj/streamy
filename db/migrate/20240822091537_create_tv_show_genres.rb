class CreateTvShowGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :tv_show_genres do |t|
      t.references :tv_show, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
