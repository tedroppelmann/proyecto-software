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

ActiveRecord::Schema.define(version: 2020_11_20_133633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.integer "valoracion"
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
    t.date "fecha"
    t.string "code"
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
    t.integer "valoracion", default: 0
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
    t.integer "monedero"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assistants", "parties"
  add_foreign_key "assistants", "users"
  add_foreign_key "comentarios", "services"
  add_foreign_key "comentarios", "users"
  add_foreign_key "parties", "comunas"
  add_foreign_key "parties", "users"
  add_foreign_key "services", "users"
end
