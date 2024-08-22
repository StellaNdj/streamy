class CreateSeasons < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons do |t|
      t.references :tv_show, null: false, foreign_key: true
      t.integer :season_number
      t.string :title
      t.text :overview
      t.date :release_date

      t.timestamps
    end
  end
end
