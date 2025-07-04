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

ActiveRecord::Schema[8.0].define(version: 2025_07_01_202713) do
  create_table "chats", id: { type: :string, limit: 36, default: -> { "uuid()" } }, force: :cascade do |t|
    t.string "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id", null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "messages", id: { type: :string, limit: 36, default: -> { "uuid()" } }, force: :cascade do |t|
    t.string "chat_id", null: false
    t.string "role"
    t.text "content"
    t.string "model_id"
    t.integer "input_tokens"
    t.integer "output_tokens"
    t.string "tool_call_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["tool_call_id"], name: "index_messages_on_tool_call_id"
  end

  create_table "sessions", id: { type: :string, limit: 36, default: -> { "uuid()" } }, force: :cascade do |t|
    t.string "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tool_calls", id: { type: :string, limit: 36, default: -> { "uuid()" } }, force: :cascade do |t|
    t.string "message_id", null: false
    t.string "tool_call_id"
    t.string "name"
    t.json "arguments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_tool_calls_on_message_id"
    t.index ["tool_call_id"], name: "index_tool_calls_on_tool_call_id"
  end

  create_table "users", id: { type: :string, limit: 36, default: -> { "uuid()" } }, force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "chats", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "sessions", "users"
  add_foreign_key "tool_calls", "messages"
end
