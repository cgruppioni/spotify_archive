class Playlist < ApplicationRecord
  has_many :tracks, dependent: :destroy

  def download_tracks(spotify_playlist)
    offset = 0

    while tracks = spotify_playlist.tracks(offset: offset).present?
      tracks.each do |track|
        @new_track = Track.create!(name: track.name, spotify_id: track.id, spotify_type: track.type, uri: track.uri, track_number: track.track_number, duration_ms: track.duration_ms, explicit: track.explicit, playlist_id: self.id)

        download_artist
      end

      offset += 100
    end
  end

  def download_artist
    track.artists.each do |artist|
      if Artist.find_by(spotify_id: artist.id).nil?
        @artist = Artist.create!(spotify_id: artist.id, name: artist.name, popularity: artist.popularity, uri: artist.uri)
          download_genre
      end

      TrackArtist.create!(track_id: @new_track.id, artist_id: @artist.id)
    end
  end

  def download_genre
    @artist.genres.each do |genre|
      if Genre.find_by(name: genre).nil?
        genre = Genre.create!(name: genre)
      end

      ArtistGenre.create!(artist_id: local_artist.id, genre_id: genre.id)
    end
  end
end