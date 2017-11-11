class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.references :artist, foreign_key: true
      t.string :name
      t.datetime :release_date
      t.integer :length

      t.timestamps
    end
  end
end
