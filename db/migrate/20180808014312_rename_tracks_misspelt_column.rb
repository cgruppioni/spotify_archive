class RenameTracksMisspeltColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :tracks, :track_nunmber, :track_number
  end
end
