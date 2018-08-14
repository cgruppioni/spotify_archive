class Genre < ApplicationRecord
  def fields
    column_names - ["created_at", "updated_at", "id"]
  end
end