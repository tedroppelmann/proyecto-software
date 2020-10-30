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

ActiveRecord::Schema.define(version: 2020_10_30_035422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistants", force: :cascade do |t|
    t.integer "bet"
    t.bigint "user_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_assistants_on_party_id"
    t.index ["user_id"], name: "index_assistants_on_user_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.text "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "service_id"
    t.index ["service_id"], name: "index_comentarios_on_service_id"
    t.index ["user_id"], name: "index_comentarios_on_user_id"
  end

  create_table "comunas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comunas_services", id: false, force: :cascade do |t|
    t.bigint "comuna_id", null: false
    t.bigint "service_id", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "titulo"
    t.string "descripcion"
    t.text "direccion"
    t.integer "capacidad"
    t.integer "costo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "comuna_id"
    t.index ["comuna_id"], name: "index_parties_on_comuna_id"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "parties_services", id: false, force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "service_id", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "cap_max"
    t.integer "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "verified", default: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age", default: 0
    t.integer "phone_number"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assistants", "parties"
  add_foreign_key "assistants", "users"
  add_foreign_key "comentarios", "services"
  add_foreign_key "comentarios", "users"
  add_foreign_key "parties", "comunas"
  add_foreign_key "parties", "users"
  add_foreign_key "services", "users"
end
