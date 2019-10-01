module Archive
  class << self
    def all_playlists
      offset = 0
      rank = 0
      user = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])
      playlists = user.playlists(offset: offset)

      # api playlist limit is 20. Continue increasing the limit until nothing is returned.
      until playlists.empty?
        playlists.each do |playlist|
          single_playlist(rank)
          rank += 1
        end

        offset += 20
      end
    end

    def single_playlist(rank)
      user = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])
      playlist = user.playlists[rank]

      return if subscribed_playlist(playlist, user)
      delete_cached_playlist(playlist)

      new_playlist = Playlist.create!(name: EmojiStripper.strip(playlist.name), href: playlist.href, spotify_id: playlist.id)

      new_playlist.download_tracks(playlist)
      return new_playlist
    end

    def subscribed_playlist(playlist, user)
      playlist.owner.id != user.id
    end

    def delete_cached_playlist(playlist)
      if playlist = Playlist.find_by_spotify_id(playlist.id)
        playlist.destroy
      end
    end
  end
end