class Genre < ApplicationRecord
  has_many :artist_genres, dependent: :destroy
  has_many :artists, through: :artist_genres

  def fields
    column_names - ["created_at", "updated_at", "id"]
  end
end