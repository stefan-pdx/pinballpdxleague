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

ActiveRecord::Schema.define(version: 15) do

  create_table "confirmations", force: :cascade do |t|
    t.integer "confirmable_id"
    t.string "confirmable_type"
    t.integer "confirmer_id"
    t.string "confirmer_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "game_outcomes", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "placement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_outcomes_on_game_id"
    t.index ["player_id"], name: "index_game_outcomes_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "round_id"
    t.integer "machine_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_games_on_machine_id"
    t.index ["round_id"], name: "index_games_on_round_id"
  end

  create_table "lineups", force: :cascade do |t|
    t.integer "playable_id"
    t.string "playable_type"
    t.integer "first_participant_id"
    t.string "first_participant_type"
    t.integer "second_participant_id"
    t.string "second_participant_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_participant_id", "first_participant_type"], name: "first_participant"
    t.index ["playable_id", "playable_type"], name: "playable"
    t.index ["second_participant_id", "second_participant_type"], name: "second_particant"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "venue_id"
    t.string "type"
    t.integer "match_number"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
    t.index ["venue_id"], name: "index_matches_on_venue_id"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "playable_id"
    t.string "playable_type"
    t.integer "participant_id"
    t.string "participant_type"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id", "participant_type"], name: "index_participants_on_participant_id_and_participant_type"
    t.index ["playable_id", "playable_type", "order"], name: "index_participants_on_playable_id_and_playable_type_and_order"
    t.index ["playable_id", "playable_type"], name: "index_participants_on_playable_id_and_playable_type"
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "match_id"
    t.string "type"
    t.integer "round_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id", "round_number"], name: "index_rounds_on_match_id_and_round_number"
    t.index ["match_id"], name: "index_rounds_on_match_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "slug"
    t.string "type"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_tournaments_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
