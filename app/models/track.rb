class Track < ApplicationRecord
  belongs_to :playlist
  has_many :artists
end