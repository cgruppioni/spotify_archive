class Playlist < ApplicationRecord
  has_many :tracks

  def fields
    column_names - ["created_at", "updated_at", "id"]
  end
end