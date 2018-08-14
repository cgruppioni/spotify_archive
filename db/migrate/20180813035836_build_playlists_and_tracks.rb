class BuildPlaylistsAndTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :href
      t.integer :spotify_id, unique: true, null: false
      t.string :name
      t.timestamps
    end

    create_table :tracks do |t|
      t.references :playlist
      t.references :artist, index: true
      t.string :name
      t.integer :spotify_id
      t.text :href
      t.integer :popularity
      t.string :spotify_type
      t.string :uri
      t.integer :track_number
      t.integer :duration_ms
      t.boolean :explicit
      t.timestamps
    end

    create_table :artists do |t|
      t.integer :spotify_id
      t.string :name
      t.integer :popularity
      t.string :uri
      t.timestamps
    end

    create_table :genres do |t|
      t.string :name
      t.timestamps
    end

    create_table :track_artists do |t|
      t.references :track, foreign_key: true
      t.references :artist, foreign_key: true
      t.timestamps
    end

    create_table :artist_genres do |t|
      t.references :artist, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end
