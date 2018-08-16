class Track < ApplicationRecord
  belongs_to :playlist
  has_many :artists
  has_many :track_artists, dependent: :destroy
  has_many :artists, through: :track_artists
end