class RenameTrackColumnDurationMmsToDurationMs < ActiveRecord::Migration[5.1]
  def change
    rename_column :tracks, :duration_mms, :duration_ms
  end
end
