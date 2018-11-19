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

ActiveRecord::Schema.define(version: 2018_09_09_151542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "objective_id"
    t.string "objective_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assistances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "session_id"
    t.integer "mark", default: 0
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_assistances_on_session_id"
    t.index ["user_id"], name: "index_assistances_on_user_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.bigint "meetup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["meetup_id"], name: "index_attachments_on_meetup_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "es_name"
    t.string "ca_name"
  end

  create_table "categories_meetups", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "meetup_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holdings", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "role", default: 0
    t.bigint "meetup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_holdings_on_meetup_id"
    t.index ["user_id"], name: "index_holdings_on_user_id"
  end

  create_table "identities", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmation_mail"
    t.string "video_url"
    t.boolean "archived", default: false
    t.boolean "on_ranking"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.bigint "meetup_id"
    t.string "attribution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["meetup_id"], name: "index_photos_on_meetup_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.integer "type_of"
    t.string "reportable_type"
    t.integer "user_id"
    t.integer "reportable_id"
    t.integer "status", default: 0
    t.string "status_comment"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "location_id"
    t.bigint "meetup_id"
    t.time "start"
    t.time "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sessions_on_event_id"
    t.index ["location_id"], name: "index_sessions_on_location_id"
    t.index ["meetup_id"], name: "index_sessions_on_meetup_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "locale", default: "es"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "role_id", default: 1
    t.text "bio", default: ""
    t.boolean "contributor", default: false
    t.boolean "notify_meetups", default: true
    t.boolean "notify_comments", default: false
    t.boolean "notify_proposals", default: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_votes_on_proposal_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "assistances", "meetups", column: "session_id"
  add_foreign_key "assistances", "users"
  add_foreign_key "attachments", "meetups"
  add_foreign_key "holdings", "meetups"
  add_foreign_key "holdings", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "photos", "meetups"
  add_foreign_key "proposals", "users"
  add_foreign_key "sessions", "events"
  add_foreign_key "sessions", "locations"
  add_foreign_key "sessions", "meetups"
  add_foreign_key "votes", "proposals"
  add_foreign_key "votes", "users"
end
