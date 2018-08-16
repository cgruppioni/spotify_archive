class Playlist < ApplicationRecord
  has_many :tracks, dependent: :destroy

  def download_tracks(spotify_playlist)
    TrackDownloader.perform(self, spotify_playlist)
  end
end