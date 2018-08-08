class TrackForeignKeyForArtists < ActiveRecord::Migration[5.1]
  def change
    add_reference :tracks, :artist, index: true
  end
end
