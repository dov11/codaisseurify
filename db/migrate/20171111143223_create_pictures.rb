class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.references :artist, foreign_key: true
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
