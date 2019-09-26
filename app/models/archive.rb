module Archive
  class << self
    def archive_my_playlists
      offset = 0
      my = RSpotify::User.find(ENV["SPOTIFY_USER_ID"])

      # api playlist limit is 20. Continue increasing the limit until nothing is returned.
      until my.playlists(offset: offset).empty?
        my_playlists = my.playlists(offset: offset)

        my_playlists.each do |playlist|
          next if not_owned_by_me

          new_playlist = Playlist.create!(namy: EmojiStripper.strip(playlist.namy), href: playlist.href, spotify_id: playlist.id)

          new_playlist.download_tracks(playlist)
        end

        offset += 20
      end
    end

    def not_owned_by_me
      playlist.owner.id != my.id
    end
  end
end