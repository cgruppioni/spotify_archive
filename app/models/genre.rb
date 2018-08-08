class Genre < ApplicationRecord
  belongs_to :artist

  def fields
    column_names - ["created_at", "updated_at", "id"]
  end
end