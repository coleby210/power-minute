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

ActiveRecord::Schema.define(version: 20160224183011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.integer  "schedule_id"
    t.string   "name"
    t.boolean  "one",         default: false
    t.boolean  "two",         default: false
    t.boolean  "three",       default: false
    t.boolean  "four",        default: false
    t.boolean  "five",        default: false
    t.boolean  "six",         default: false
    t.boolean  "seven",       default: false
    t.boolean  "eight",       default: false
    t.boolean  "nine",        default: false
    t.boolean  "ten",         default: false
    t.boolean  "eleven",      default: false
    t.boolean  "twelve",      default: false
    t.boolean  "thirteen",    default: false
    t.boolean  "fourteen",    default: false
    t.boolean  "fifteen",     default: false
    t.boolean  "sixteen",     default: false
    t.boolean  "seventeen",   default: false
    t.boolean  "eighteen",    default: false
    t.boolean  "nineteen",    default: false
    t.boolean  "twenty",      default: false
    t.boolean  "twentyone",   default: false
    t.boolean  "twentytwo",   default: false
    t.boolean  "twentythree", default: false
    t.boolean  "twentyfour",  default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "days", ["schedule_id"], name: "index_days_on_schedule_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workout_template_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "group_comments", force: :cascade do |t|
    t.integer  "member_id",    null: false
    t.integer  "group_id",     null: false
    t.string   "comment_text", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "picture"
    t.integer  "admin_id",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "private_status"
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                     null: false
    t.string   "encrypted_password",     default: "",                                     null: false
    t.string   "profile_picture",        default: "http://doge4.us/images/dogecoin1.gif"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "timezone",               default: "-8"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workout_templates", force: :cascade do |t|
    t.string   "title",                          null: false
    t.string   "description"
    t.string   "image"
    t.integer  "creator_id"
    t.integer  "category_id",                    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "private_status", default: false
  end

  add_index "workout_templates", ["category_id"], name: "index_workout_templates_on_category_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.integer  "workout_template_id", null: false
    t.integer  "reps"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree
  add_index "workouts", ["workout_template_id"], name: "index_workouts_on_workout_template_id", using: :btree

  add_foreign_key "days", "schedules"
  add_foreign_key "schedules", "users"
  add_foreign_key "workouts", "users"
  add_foreign_key "workouts", "workout_templates"
end
