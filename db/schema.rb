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

ActiveRecord::Schema.define(version: 20180808014635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fantasy_players", force: :cascade do |t|
    t.integer "player_id"
    t.bigint "fantasy_team_id"
    t.boolean "watch", default: false
    t.boolean "keeper", default: false
    t.float "auction_projected_price"
    t.float "auction_spend_price"
    t.float "auction_sold_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fantasy_team_id"], name: "index_fantasy_players_on_fantasy_team_id"
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
