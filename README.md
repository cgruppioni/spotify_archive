1. Run `rake db:migrate` and `bundle install`
1. Add your Spotify credentials to `.env`


RSpotify.authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])

**RANK** is where in the playlist order the playlist is. ie: 0 would be the first playlist on your dashboard
RSpotify::Archive.single_playlist(**RANK**)
RSpotify::Archive.single_playlist(0)
