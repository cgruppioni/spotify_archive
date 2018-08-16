class ArtistDownloader
  attr_accessor :new_track, :track

  def self.perform(new_track, track)
    new(new_track, track).perform
  end

  def initialize(new_track, track)
    @new_track = new_track
    @track = track
  end

  def perform
    track.artists.each do |artist|
      local_artist = Artist.find_by(spotify_id: artist.id)

      if local_artist.nil?
        local_artist = Artist.create!(spotify_id: artist.id, name: artist.name, popularity: artist.popularity, uri: artist.uri)

        GenreDownloader.perform(local_artist, artist.genres)
      end

      TrackArtist.create!(track_id: new_track.id, artist_id: local_artist.id)
    end
  end
end