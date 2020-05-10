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

ActiveRecord::Schema.define(version: 2020_05_03_063551) do

  create_table "advisors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "gender", default: "", null: false
    t.string "job", null: false
    t.string "shop", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_advisors_on_email", unique: true
    t.index ["gender"], name: "index_advisors_on_gender"
    t.index ["job"], name: "index_advisors_on_job"
    t.index ["name"], name: "index_advisors_on_name"
    t.index ["reset_password_token"], name: "index_advisors_on_reset_password_token", unique: true
  end

  create_table "message_chats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.string "image"
    t.bigint "receiver_id"
    t.bigint "advisor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_message_chats_on_advisor_id"
    t.index ["receiver_id"], name: "index_message_chats_on_receiver_id"
  end

  create_table "receivers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "gender", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_receivers_on_email", unique: true
    t.index ["gender"], name: "index_receivers_on_gender"
    t.index ["name"], name: "index_receivers_on_name"
    t.index ["reset_password_token"], name: "index_receivers_on_reset_password_token", unique: true
  end

  add_foreign_key "message_chats", "advisors"
  add_foreign_key "message_chats", "receivers"
end
