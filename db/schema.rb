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

ActiveRecord::Schema.define(version: 2021_06_27_184642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inputs", force: :cascade do |t|
    t.text "email"
    t.text "firstname"
    t.text "lastname"
    t.text "language"
    t.integer "proficiency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", primary_key: "lang_name", id: { type: :text, comment: "Name of language" }, force: :cascade do |t|
    t.integer "avg_pro", null: false, comment: "Avg. of all persons who speak the language"
  end

  create_table "messages", primary_key: "message", id: :text, force: :cascade do |t|
    t.text "sender", null: false
    t.text "receiver", null: false
    t.text "lang_name", null: false
  end

  create_table "proficiencies", primary_key: "username", id: :text, force: :cascade do |t|
    t.text "lang_name", null: false
    t.integer "pro_lev", null: false
  end

  create_table "users", primary_key: "email", id: :string, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "messages", "languages", column: "lang_name", primary_key: "lang_name", name: "Language"
  add_foreign_key "messages", "proficiencies", column: "receiver", primary_key: "username", name: "Receiver"
  add_foreign_key "messages", "proficiencies", column: "sender", primary_key: "username", name: "Sender"
  add_foreign_key "proficiencies", "languages", column: "lang_name", primary_key: "lang_name", name: "Language"
  add_foreign_key "proficiencies", "users", column: "username", primary_key: "email", name: "User"
end
