def archive_playlist(playlist)
  new_playlist = Playlist.create(name: playlist.name, href: playlist.href, spotify_id: playlist.id)

  tracks = playlist.tracks
  tracks.each do |track|
    new_track = Track.new(name: track.name, spotify_id: track.id, spotify_type: track.type, uri: track.uri, track_number: track.track_number, duration_ms: track.duration_ms, explicit: track.explicit)
    new_track.playlist_id = playlist.id
    new_track.save!
  end
end
archive_playlist(playlist)