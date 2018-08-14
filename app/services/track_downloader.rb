class TrackDownloader
  attr_accessor :playlist, :spotify_playlist

  def self.perform(playlist, spotify_playlist)
    new(playlist, spotify_playlist).perform
  end

  def initialize(playlist, spotify_playlist)
    @playlist = playlist
    @spotify_playlist = spotify_playlist
  end

  def perform
    offset = 0

    until spotify_playlist.tracks(offset: offset).empty?
      tracks = spotify_playlist.tracks(offset: offset)

      tracks.each do |track|
        new_track = Track.create!(name: track.name, spotify_id: track.id, spotify_type: track.type, uri: track.uri, track_number: track.track_number, duration_ms: track.duration_ms, explicit: track.explicit, playlist_id: playlist.id)
      end

      offset += 100
    end
  end
end