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

ActiveRecord::Schema.define(version: 20180822154724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.bigint "player_id"
    t.float "auction_price"
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_auctions_on_player_id"
  end

  create_table "fantasy_players", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "fantasy_team_id", default: 1
    t.boolean "watch", default: false
    t.boolean "keeper", default: false
    t.float "auction_projected_price", default: 0.0
    t.float "auction_spend_price", default: 0.0
    t.float "auction_sold_price", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "rookie_asset", default: false
    t.index ["fantasy_team_id"], name: "index_fantasy_players_on_fantasy_team_id"
    t.index ["player_id"], name: "index_fantasy_players_on_player_id"
  end

  create_table "fantasy_projections", force: :cascade do |t|
    t.bigint "player_id"
    t.string "position"
    t.float "completions"
    t.float "attempts"
    t.float "passing_yards"
    t.float "passing_td"
    t.float "passing_int"
    t.float "rush_yards"
    t.float "rush_att"
    t.float "rush_td"
    t.float "rec"
    t.float "rec_yards"
    t.float "rec_td"
    t.float "fumbles"
    t.float "sacks"
    t.float "interceptions"
    t.float "fumble_rec"
    t.float "td"
    t.float "special_team_td"
    t.float "xp"
    t.float "fg"
    t.float "fantasy_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_fantasy_projections_on_player_id"
  end

  create_table "fantasy_teams", force: :cascade do |t|
    t.string "fantasy_team_name"
    t.string "owner_name"
    t.float "auction_cash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", id: :integer, default: nil, force: :cascade do |t|
    t.string "position"
    t.string "display_name"
    t.string "first_name"
    t.string "last_name"
    t.string "team"
    t.integer "bye_week"
    t.float "nerd_rank"
    t.integer "position_rank"
    t.integer "overall_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "code"
    t.string "fullName"
    t.string "shortName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
