class CreateWatchlists < ActiveRecord::Migration[7.1]
  def change
    create_table :watchlists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :tv_show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
