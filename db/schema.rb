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

ActiveRecord::Schema[7.0].define(version: 2023_07_22_025946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "imagen_perfils", force: :cascade do |t|
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_imagen_perfils_on_imageable"
  end

  create_table "oferta", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.string "salario"
    t.string "horas"
    t.string "ciudad"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_oferta_on_usuario_id"
  end

  create_table "postulacions", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.bigint "oferta_id", null: false
    t.text "mensaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oferta_id"], name: "index_postulacions_on_oferta_id"
    t.index ["usuario_id"], name: "index_postulacions_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "oferta", "usuarios"
  add_foreign_key "postulacions", "oferta", column: "oferta_id"
  add_foreign_key "postulacions", "usuarios"
end
