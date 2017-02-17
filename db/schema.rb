# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170217101159) do

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "energy_usages", force: :cascade do |t|
    t.decimal  "value",         precision: 20, scale: 5
    t.integer  "building_id"
    t.integer  "mesurement_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "energy_usages", ["building_id"], name: "index_energy_usages_on_building_id"
  add_index "energy_usages", ["mesurement_id"], name: "index_energy_usages_on_mesurement_id"

  create_table "mesurements", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
