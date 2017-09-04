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

ActiveRecord::Schema.define(version: 20170904093125) do

  create_table "accounthistroys", force: :cascade do |t|
    t.string   "order"
    t.datetime "order_date"
    t.integer  "account_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "credit_histroy"
    t.index ["account_id"], name: "index_accounthistroys_on_account_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer  "supplier_id"
    t.string   "account_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "representative_id"
    t.string   "subdomain"
    t.index ["supplier_id"], name: "index_accounts_on_supplier_id", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.string   "county"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "client_id"
    t.integer  "availability"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "physician_id"
    t.string   "patient_id"
    t.datetime "appointment_data"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["physician_id"], name: "index_appointments_on_physician_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assemblies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "part_id"
    t.index ["part_id"], name: "index_assemblies_on_part_id"
  end

  create_table "assemblies_parts", id: false, force: :cascade do |t|
    t.integer "assembly_id"
    t.integer "part_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "books_updated_at"
    t.boolean  "active"
  end

  create_table "books", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "content"
    t.text     "summary"
    t.boolean  "special"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "telephone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "role_id"
    t.integer  "orders_count"
    t.integer  "lock_version"
  end

  create_table "clients_roles", id: false, force: :cascade do |t|
    t.integer "client_id"
    t.integer "role_id"
    t.index ["client_id"], name: "index_clients_roles_on_client_id"
    t.index ["role_id"], name: "index_clients_roles_on_role_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "paragraph"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_details", force: :cascade do |t|
    t.string   "telephones"
    t.string   "email"
    t.string   "wechat"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.text     "content"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_line_items_on_book_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "product"
    t.string   "price"
    t.string   "quantity"
    t.string   "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "client_id"
    t.string   "status"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "paragraphs", force: :cascade do |t|
    t.text     "content"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_paragraphs_on_section_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "assembly_id"
    t.index ["assembly_id"], name: "index_parts_on_assembly_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "terms_of_service"
    t.string   "email"
    t.string   "password"
    t.string   "bio"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "time_zone"
  end

  create_table "physicians", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "picture_files", force: :cascade do |t|
    t.string   "filepath"
    t.string   "filename"
    t.string   "fileinfo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "points"
    t.string   "games_played"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "legacy_code"
  end

  create_table "representatives", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
  end

  create_table "sections", force: :cascade do |t|
    t.text     "content"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_sections_on_document_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string   "event"
    t.datetime "schedule"
    t.integer  "guid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "guid"
  end

end
