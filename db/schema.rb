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

ActiveRecord::Schema[7.0].define(version: 2024_07_23_180859) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :customer_options, [
    "unready",
    "ready",
    "sent",
    "approved",
    "rejected",
  ], force: :cascade

  create_enum :customers, [
    "sparky",
    "mctractor",
  ], force: :cascade

  create_enum :role_options, [
    "quality_manager",
    "quality_admin",
    "qc_tech",
    "prod_manager",
  ], force: :cascade

  create_table "parts", force: :cascade do |t|
    t.string "part_number", null: false
    t.string "revision", null: false
    t.string "job"
    t.string "drawing"
    t.string "base_material"
    t.string "finish"
    t.boolean "measured_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_number", "revision"], name: "index_parts_on_part_number_and_revision", unique: true
  end

  create_table "quality_projects", force: :cascade do |t|
    t.bigint "part_id", null: false
    t.string "customer", null: false
    t.string "customer_request"
    t.string "purchase_order"
    t.string "inspection_plan"
    t.boolean "report_approval", default: false, null: false
    t.string "assembled_record"
    t.boolean "record_approval", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "customer_approval", default: "unready", enum_type: "customer_options"
    t.index ["part_id"], name: "index_quality_projects_on_part_id"
  end

  create_table "subcomponents", force: :cascade do |t|
    t.bigint "parent_id", null: false
    t.bigint "child_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_subcomponents_on_child_id"
    t.index ["parent_id"], name: "index_subcomponents_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "roles", default: "quality_admin", null: false, enum_type: "role_options"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "quality_projects", "parts"
  add_foreign_key "subcomponents", "parts", column: "child_id"
  add_foreign_key "subcomponents", "parts", column: "parent_id"
end
