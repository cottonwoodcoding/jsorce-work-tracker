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

ActiveRecord::Schema.define(version: 20150421233830) do

  create_table "addresses", force: true do |t|
    t.string   "value"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
  end

  add_index "addresses", ["value"], name: "index_addresses_on_value"

  create_table "appointments", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "number"
    t.string   "address"
    t.text     "notes"
    t.string   "status"
    t.string   "status_notes"
    t.date     "scheduled"
    t.date     "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.integer  "work_period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
  end

  add_index "jobs", ["created_by"], name: "index_jobs_on_created_by"
  add_index "jobs", ["name"], name: "index_jobs_on_name"

  create_table "notes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_appointments", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "address"
    t.text     "notes"
    t.string   "status"
    t.string   "status_notes"
    t.date     "scheduled"
    t.date     "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passed_work_periods", force: true do |t|
    t.text     "work_period_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "work_logs", force: true do |t|
    t.date     "date"
    t.text     "work_description"
    t.string   "total_time_worked"
    t.string   "time_started"
    t.string   "time_ended"
    t.string   "money_spent"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "spent_description"
    t.integer  "break"
  end

  create_table "work_periods", force: true do |t|
    t.date     "date_started"
    t.date     "date_ended"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
