class Artist < ApplicationRecord
  has_many :tracks
  has_many :genres

  def self.fields
    column_names - ["created_at", "updated_at", "id"]
  end
end