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

ActiveRecord::Schema.define(version: 20170124121642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "banners", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "left_banner_image_file_name"
    t.string   "left_banner_image_content_type"
    t.integer  "left_banner_image_file_size"
    t.datetime "left_banner_image_updated_at"
    t.string   "right_banner_image_file_name"
    t.string   "right_banner_image_content_type"
    t.integer  "right_banner_image_file_size"
    t.datetime "right_banner_image_updated_at"
  end

  create_table "employers", force: :cascade do |t|
    t.boolean  "profile"
    t.string   "name"
    t.text     "about"
    t.text     "vision"
    t.string   "website_link"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "youtube_link"
    t.string   "instagram_link"
    t.string   "google_plus_link"
    t.string   "linkedin_link"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "published_at"
    t.string   "employer_header_image_file_name"
    t.string   "employer_header_image_content_type"
    t.integer  "employer_header_image_file_size"
    t.datetime "employer_header_image_updated_at"
    t.string   "employer_logo_image_file_name"
    t.string   "employer_logo_image_content_type"
    t.integer  "employer_logo_image_file_size"
    t.datetime "employer_logo_image_updated_at"
    t.text     "summary"
  end

  create_table "job_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.boolean  "exclusive"
    t.integer  "employer_id"
    t.integer  "job_category_id"
    t.integer  "job_type_id"
    t.string   "title"
    t.text     "content"
    t.string   "location"
    t.date     "apply_date"
    t.text     "apply_info"
    t.text     "contact_info"
    t.datetime "published_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["employer_id"], name: "index_jobs_on_employer_id", using: :btree
    t.index ["job_category_id"], name: "index_jobs_on_job_category_id", using: :btree
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id", using: :btree
  end

  add_foreign_key "jobs", "employers"
  add_foreign_key "jobs", "job_categories"
  add_foreign_key "jobs", "job_types"
end
