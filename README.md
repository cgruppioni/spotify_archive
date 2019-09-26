# Download your Spotify playlist data and store it locally for archiving.

1. `RSpotify.authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])`
2. `RSpotify::Archive.archive_playlists`

TODO:
* Add instructions for how to start from very beginning (installing ruby, rails, posgres, env variables, etc.. )
* Spot check data vs. in spotify
* Write tests
* Make UI
* Deploy to Heroku