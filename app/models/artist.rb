class Artist < ApplicationRecord
  has_many :track_artists, dependent: :destroy
  has_many :tracks, through: :track_artists
  has_many :artist_genres, dependent: :destroy
  has_many :genres, through: :artist_genres
end