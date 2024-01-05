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

ActiveRecord::Schema[7.1].define(version: 2023_12_29_091523) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "point_rank_items", force: :cascade do |t|
    t.bigint "ranking_board_id", null: false
    t.integer "score", null: false
    t.string "name"
    t.string "user_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ranking_board_id"], name: "index_point_rank_items_on_ranking_board_id"
    t.index ["score"], name: "index_point_rank_items_on_score"
    t.index ["updated_at"], name: "index_point_rank_items_on_updated_at"
    t.index ["user_identifier"], name: "index_point_rank_items_on_user_identifier", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "code"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_projects_on_code", unique: true
  end

  create_table "ranking_boards", force: :cascade do |t|
    t.string "type"
    t.bigint "project_id", null: false
    t.integer "num", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["num"], name: "index_ranking_boards_on_num", unique: true
    t.index ["project_id"], name: "index_ranking_boards_on_project_id"
  end

  add_foreign_key "point_rank_items", "ranking_boards"
  add_foreign_key "ranking_boards", "projects"
end
