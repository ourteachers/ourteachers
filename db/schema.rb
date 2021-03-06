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

ActiveRecord::Schema.define(version: 20150517201612) do

  create_table "qualities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualities_reviews", id: false, force: true do |t|
    t.integer "quality_id", null: false
    t.integer "review_id",  null: false
  end

  add_index "qualities_reviews", ["quality_id", "review_id"], name: "index_qualities_reviews_on_quality_id_and_review_id"
  add_index "qualities_reviews", ["review_id", "quality_id"], name: "index_qualities_reviews_on_review_id_and_quality_id"

  create_table "reviews", force: true do |t|
    t.integer  "child_happiness"
    t.integer  "child_learning"
    t.integer  "communication"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.integer  "user_id"
  end

  create_table "schools", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "google_reference"
    t.string   "place_id"
    t.string   "address"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects_teachers", id: false, force: true do |t|
    t.integer "teacher_id", null: false
    t.integer "subject_id", null: false
  end

  add_index "subjects_teachers", ["subject_id", "teacher_id"], name: "index_subjects_teachers_on_subject_id_and_teacher_id"
  add_index "subjects_teachers", ["teacher_id", "subject_id"], name: "index_subjects_teachers_on_teacher_id_and_subject_id"

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.integer  "number_of_reviews"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text   "bio"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
