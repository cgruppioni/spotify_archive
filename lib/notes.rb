user_id = ENV['SPOTIFY_USER_ID']
user = RSpotify::User.find(user_id)

#20 is the max playlists amount
20_playlists