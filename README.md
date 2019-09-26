RSpotify.authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
RSpotify::Archive.single_playlist

RSpotify::Archive.archive_playlists
