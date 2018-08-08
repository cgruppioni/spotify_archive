class CreateGenre < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.references :artists, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
