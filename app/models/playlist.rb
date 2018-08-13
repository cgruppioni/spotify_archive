class Playlist < ApplicationRecord
  has_many :tracks

  def fields
    column_names - ["created_at", "updated_at", "id"]
  end

  def download_tracks
    TrackDownloader.perform(self)
  end
end