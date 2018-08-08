class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :href
      t.integer :spotify_id
      t.string :name
      t.timestamps
    end
  end
end
