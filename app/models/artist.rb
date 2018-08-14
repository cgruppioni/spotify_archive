class Artist < ApplicationRecord
  has_many :tracks

  def self.fields
    column_names - ["created_at", "updated_at", "id"]
  end
end