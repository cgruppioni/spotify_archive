class Track < ApplicationRecord
  belongs_to :playlist
  has_many :artists
  has_many :track_artists, dependent: :destroy
  has_many :artists, through: :track_artists

  def self.fields
    column_names - ["created_at", "updated_at", "id"]
  end
end