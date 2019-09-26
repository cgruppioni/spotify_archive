class Playlist < ApplicationRecord
  has_many :tracks, dependent: :destroy

  def download_tracks(spotify_playlist)
    offset = 0

      until spotify_playlist.tracks(offset: offset).empty?
        tracks = spotify_playlist.tracks(offset: offset)

        tracks.each do |track|
          new_track = Track.create!(name: track.name, spotify_id: track.id, spotify_type: track.type, uri: track.uri, track_number: track.track_number, duration_ms: track.duration_ms, explicit: track.explicit, playlist_id: self.id)

          ArtistDownloader.perform(new_track, track)
        end

        offset += 100
      end
  end
  end
end