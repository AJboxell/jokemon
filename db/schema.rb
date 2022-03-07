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

ActiveRecord::Schema.define(version: 2022_03_06_102726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "adversary_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "message"
    t.integer "turn"
    t.string "result"
    t.index ["adversary_id"], name: "index_battles_on_adversary_id"
    t.index ["user_id"], name: "index_battles_on_user_id"
  end

  create_table "decision_matrices", force: :cascade do |t|
    t.string "one"
    t.string "two"
    t.string "three"
    t.string "four"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "decision_matrices_moves", id: false, force: :cascade do |t|
    t.bigint "move_id", null: false
    t.bigint "decision_matrix_id", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "power"
    t.integer "accuracy"
    t.string "status"
    t.string "element"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "special"
  end

  create_table "moves_pokemons", id: false, force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.bigint "move_id", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "attack"
    t.string "status", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max_hp"
    t.integer "evasion"
    t.string "element"
    t.integer "sp_attack"
  end

  add_foreign_key "battles", "pokemons", column: "adversary_id"
  add_foreign_key "battles", "pokemons", column: "user_id"
end
