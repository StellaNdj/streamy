class CreateEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :episodes do |t|
      t.references :season, null: false, foreign_key: true
      t.integer :episode_number
      t.string :title
      t.text :overview
      t.date :release_date

      t.timestamps
    end
  end
end
