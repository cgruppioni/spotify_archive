# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180813035836) do

  create_table "artists", force: :cascade do |t|
    t.integer "spotify_id"
    t.string "name"
    t.integer "popularity"
    t.string "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.integer "artists_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artists_id"], name: "index_genres_on_artists_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "href"
    t.integer "spotify_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "artist_id"
    t.string "name"
    t.integer "spotify_id", null: false
    t.text "href"
    t.integer "popularity"
    t.string "spotify_type"
    t.string "uri"
    t.integer "track_nunmber"
    t.integer "duration_ms"
    t.boolean "explicit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
    t.index ["playlist_id"], name: "index_tracks_on_playlist_id"
  end

end
