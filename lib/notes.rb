
user_id = ENV['SPOTIFY_USER_ID']
user = RSpotify::User.find(user_id)


#20 is the limit
# TODO learn how to offset or I delete them as I go along
playlists = user.playlists
playlist = playlists.first

Archiver.archive_playlist(playlist)
