class Artist < ApplicationRecord
  has_many :tracks
  has_many :genres
end