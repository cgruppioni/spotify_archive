class TrackDownloader
  attr_accessor :playlist, :offset

  def self.perform(playlist)
    new(playlist).perform
  end

  def initialize(playlist)
    @playlist = playlist
    @offset = 0
  end

  def perform
    until playlist.tracks(offset: offset).empty?
      tracks = playlist.tracks(offset: offset)

      tracks.each do |track|
        new_track = Track.create!(name: track.name, spotify_id: track.id, spotify_type: track.type, uri: track.uri, track_number: track.track_number, duration_ms: track.duration_ms, explicit: track.explicit, playlist_id: new_playlist.id)
      end

      offset += 100
    end
  end
end