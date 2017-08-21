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

ActiveRecord::Schema.define(version: 20170821194223) do

  create_table "event_requests", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "repo_id"
    t.integer "event_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "repo_id", "event_type_id"], name: "index_event_requests_on_owner_id_and_repo_id_and_event_type_id", unique: true
    t.index ["owner_id"], name: "index_event_requests_on_owner_id"
    t.index ["repo_id"], name: "index_event_requests_on_repo_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_event_types_on_name", unique: true
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_owners_on_name", unique: true
  end

  create_table "owners_repos", force: :cascade do |t|
    t.integer "repo_id"
    t.integer "owner_id"
    t.index ["repo_id", "owner_id"], name: "index_owners_repos_on_repo_id_and_owner_id", unique: true
  end

  create_table "repos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_repos_on_name", unique: true
  end

end
