module Archive
  class << self
    def archive_playlists
      first_round = true
      offset = 0

      user = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])
      last_id = user.playlists(offset: offset).last.id

      # api playlist limit is 20. Continue increasing the limit until nothing is returned.
      until first_round == false && user.playlists(offset: offset).empty?
        first_round = false
        playlists = user.playlists(offset: offset)

        playlists.each do |playlist|
          new_playlist = Playlist.create!(name: playlist.name, href: playlist.href, spotify_id: playlist.id)

          playlist.tracks.each do |track|
            new_track = Track.create!(name: track.name, spotify_id: track.id, spotify_type: track.type, uri: track.uri, track_number: track.track_number, duration_ms: track.duration_ms, explicit: track.explicit, playlist_id: new_playlist.id)
          end
        end

        last_id = playlists.last.id
        offset += 20
      end
    end
  end
end