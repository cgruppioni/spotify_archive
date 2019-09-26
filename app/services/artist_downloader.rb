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
      if Artist.find_by(spotify_id: artist.id).nil?
        artist = Artist.create!(spotify_id: artist.id, name: artist.name, popularity: artist.popularity, uri: artist.uri)
          download_genre
      end

      TrackArtist.create!(track_id: new_track.id, artist_id: artist.id)
    end
  end

  def download_genre
    return if genres.nil?

    genres.each do |genre|
      if Genre.find_by(name: genre).nil?
        genre = Genre.create!(name: genre)
      end

      ArtistGenre.create!(artist_id: local_artist.id, genre_id: genre.id)
    end
  end
end