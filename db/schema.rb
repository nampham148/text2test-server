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

ActiveRecord::Schema.define(version: 2019_09_15_141248) do

  create_table "course_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "course_id"], name: "index_course_memberships_on_user_id_and_course_id", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_id", default: "", null: false
    t.string "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_fill_in_question_relationships", force: :cascade do |t|
    t.integer "mock_exam_id", null: false
    t.integer "fill_in_question_id", null: false
    t.string "answer"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_mcq_relationships", force: :cascade do |t|
    t.integer "mock_exam_id", null: false
    t.integer "mcq_question_id", null: false
    t.integer "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mcq_question_id"], name: "index_exam_mcq_relationships_on_mcq_question_id"
    t.index ["mock_exam_id"], name: "index_exam_mcq_relationships_on_mock_exam_id"
  end

  create_table "fill_in_questions", force: :cascade do |t|
    t.string "question", null: false
    t.string "answer", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flashcards", force: :cascade do |t|
    t.string "keyword", null: false
    t.text "value", null: false
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mcq_questions", force: :cascade do |t|
    t.string "question", null: false
    t.string "option_a", null: false
    t.string "option_b", null: false
    t.string "option_c"
    t.string "option_d"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_mcq_questions_on_course_id"
  end

  create_table "mock_exams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.integer "score"
    t.integer "num_questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "notes", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
