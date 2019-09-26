module Archive
  class << self
    def all_playlists
      offset = 0
      user = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])
      playlists = user.playlists(offset: offset)

      # api playlist limit is 20. Continue increasing the limit until nothing is returned.
      until playlists.empty?
        playlists.each do |playlist|
          unless subscribed_playlist(playlist, user)
            download_single_playlist(playlist)
          end
        end

        offset += 20
      end
    end

    def subscribed_playlist(playlist, user)
      playlist.owner.id != user.id
    end

    def single_playlist
      user = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])
      playlist = user.playlists.second

      new_playlist = Playlist.create!(name: EmojiStripper.strip(playlist.name), href: playlist.href, spotify_id: playlist.id)

      new_playlist.download_tracks(playlist)
    end
  end
end