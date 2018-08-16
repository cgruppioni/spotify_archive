class Track < ApplicationRecord
  belongs_to :playlist
  has_many :artists
  has_many :track_artists, dependent: :destroy

  def self.fields
    column_names - ["created_at", "updated_at", "id"]
  end
end