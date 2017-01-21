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

ActiveRecord::Schema.define(version: 20150719115626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "subject_item_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "participations", ["student_id"], name: "index_participations_on_student_id", using: :btree
  add_index "participations", ["subject_item_id"], name: "index_participations_on_subject_item_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject_item_notes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "subject_item_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "student_id"
  end

  add_index "subject_item_notes", ["student_id"], name: "index_subject_item_notes_on_student_id", using: :btree
  add_index "subject_item_notes", ["subject_item_id"], name: "index_subject_item_notes_on_subject_item_id", using: :btree

  create_table "subject_items", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "teacher_id"
  end

  add_index "subject_items", ["teacher_id"], name: "index_subject_items_on_teacher_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "academic_title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "participations", "students"
  add_foreign_key "participations", "subject_items"
  add_foreign_key "subject_item_notes", "students"
  add_foreign_key "subject_item_notes", "subject_items"
  add_foreign_key "subject_items", "teachers"
end
