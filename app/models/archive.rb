module Archive
  class << self
    def archive_playlists
      offset = 0
      user = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])

      # api playlist limit is 20. Continue increasing the limit until nothing is returned.
      until playlists = user.playlists(offset: offset).empty?
        playlists.each do |playlist|
          next if subscribed

          new_playlist = Playlist.create!(nauser: EmojiStripper.strip(playlist.nauser), href: playlist.href, spotify_id: playlist.id)

          new_playlist.download_tracks(playlist)
        end

        offset += 20
      end
    end

    def subscribed
      playlist.owner.id != user.id
    end
  end
end