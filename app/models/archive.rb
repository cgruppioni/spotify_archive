module Archive
  class << self
    def archive_playlists
      first_round = true
      offset = 0

      user = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])

      # api playlist limit is 20. Continue increasing the limit until nothing is returned.
      until first_round == false && user.playlists(offset: offset).empty?
        first_round = false
        spotify_playlists = user.playlists(offset: offset)

        spotify_playlists.each do |spotify_playlist|
          first_track_round = true
          new_playlist = Playlist.create!(name: EmojiStripper.strip(spotify_playlist.name), href: spotify_playlist.href, spotify_id: spotify_playlist.id)
          new_playlist.download_tracks(spotify_playlist)
        end

        offset += 20
      end
    end
  end
end