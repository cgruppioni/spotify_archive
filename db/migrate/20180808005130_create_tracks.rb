class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.references :playlist
      t.string :name
      t.integer :spotify_id
      t.text :href
      t.integer :popularity
      t.string :type
      t.string :uri
      t.integer :track_nunmber
      t.integer :duration_mms
      t.boolean :explicit
      t.timestamps
    end
  end
end
