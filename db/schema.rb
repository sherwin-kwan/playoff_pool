# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_03_051509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "version"
    t.string "summary"
    t.text "note"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "predictions", force: :cascade do |t|
    t.bigint "winner_id"
    t.integer "games"
    t.bigint "user_id"
    t.bigint "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "conn_smythe_id"
    t.index ["series_id"], name: "index_predictions_on_series_id"
    t.index ["user_id"], name: "index_predictions_on_user_id"
    t.index ["winner_id"], name: "index_predictions_on_winner_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "year"
    t.integer "correct"
    t.integer "incorrect"
    t.integer "points"
    t.integer "lower_seed_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lower_seed_incorrect"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "round"
    t.string "fancy_name"
    t.integer "special", default: 0
    t.integer "base_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series", force: :cascade do |t|
    t.bigint "team1_id"
    t.bigint "team2_id"
    t.bigint "winner_id"
    t.integer "games"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
    t.integer "status", default: 0
    t.datetime "start_time", precision: nil
    t.integer "conn_smythe_id"
    t.index ["round_id"], name: "index_series_on_round_id"
    t.index ["team1_id"], name: "index_series_on_team1_id"
    t.index ["team2_id"], name: "index_series_on_team2_id"
    t.index ["winner_id"], name: "index_series_on_winner_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.bigint "division_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nhl_api_id"
    t.string "logo_src"
    t.string "abbrev"
    t.index ["division_id"], name: "index_teams_on_division_id"
  end

  create_table "user_scores", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "year"
    t.float "score"
    t.index ["user_id"], name: "index_user_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "given_name"
    t.integer "privilege", default: 0
    t.text "about_text"
  end

end
