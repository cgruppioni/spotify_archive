class Playlist < ApplicationRecord
  has_many :playlist_tracks, dependent: :destroy
  has_many :tracks, through: :playlist_tracks

  def download_tracks(spotify_playlist)
    offset = 0

    until spotify_playlist.tracks(offset: offset).empty?
      spotify_playlist.tracks(offset: offset).each do |track|
        download_track(track)
      end

      offset += 100
    end
  end

  def download_track(track)
    local_track = Track.find_by(spotify_id: track.id)

    if local_track.nil?
      local_track = Track.create!(name: track.name, spotify_id: track.id, spotify_type: track.type, uri: track.uri, track_number: track.track_number, duration_ms: track.duration_ms, explicit: track.explicit, playlist_id: self.id)
      download_artists(local_track, track)
    end

    PlaylistTrack.create!(playlist_id: self.id, track_id: local_track.id)
  end

  def download_artists(local_track, track)
    track.artists.each do |artist|
      local_artist = Artist.find_by(spotify_id: artist.id)
      if local_artist.nil?
        local_artist = Artist.create!(spotify_id: artist.id, name: artist.name, popularity: artist.popularity, uri: artist.uri)
          download_genre(local_artist, artist.genres)
      end

      TrackArtist.create!(track_id: local_track.id, artist_id: local_artist.id)
    end
  end

  def download_genre(artist, genres)
    genres.each do |genre|
      local_genre = Genre.find_by(name: genre)
      if local_genre.nil?
        local_genre = Genre.create!(name: genre)
      end

      ArtistGenre.create!(artist_id: artist.id, genre_id: local_genre.id)
    end
  end
end