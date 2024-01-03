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

ActiveRecord::Schema[7.1].define(version: 2024_01_03_063917) do
  create_table "application_questions", force: :cascade do |t|
    t.text "question_text"
    t.text "answer_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engagements", force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "details"
    t.string "subject"
    t.text "availability"
    t.integer "fifteen_minutes_per_week"
    t.index ["student_id"], name: "index_engagements_on_student_id"
    t.index ["tutor_id"], name: "index_engagements_on_tutor_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "stripe_price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_informations", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "street_address"
    t.string "city"
    t.text "zipcode"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_personal_informations_on_user_id"
  end

  create_table "stripe_offers", force: :cascade do |t|
    t.string "price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stripe_student_offerings", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "offer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_stripe_student_offerings_on_offer_id"
    t.index ["student_id"], name: "index_stripe_student_offerings_on_student_id"
  end

  create_table "student_offerings", force: :cascade do |t|
    t.integer "offer_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_student_offerings_on_offer_id"
    t.index ["student_id"], name: "index_student_offerings_on_student_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tutor_application_id", null: false
    t.index ["tutor_application_id"], name: "index_subjects_on_tutor_application_id"
  end

  create_table "tutor_applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tutor_id"
    t.text "educational_history"
    t.text "tutoring_skills"
    t.text "resume"
    t.index ["tutor_id"], name: "index_tutor_applications_on_tutor_id"
  end

  create_table "tutoring_sessions", force: :cascade do |t|
    t.date "date"
    t.integer "engagement_id", null: false
    t.integer "length_fifteen_minutes"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["engagement_id"], name: "index_tutoring_sessions_on_engagement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.boolean "tutor", default: false
    t.boolean "student", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "approved", default: false
    t.string "stripe_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "engagements", "users", column: "student_id"
  add_foreign_key "engagements", "users", column: "tutor_id"
  add_foreign_key "personal_informations", "users"
  add_foreign_key "stripe_student_offerings", "offers"
  add_foreign_key "stripe_student_offerings", "users", column: "student_id"
  add_foreign_key "student_offerings", "offers"
  add_foreign_key "student_offerings", "users", column: "student_id"
  add_foreign_key "subjects", "tutor_applications"
  add_foreign_key "tutor_applications", "users", column: "tutor_id"
  add_foreign_key "tutoring_sessions", "engagements"
end
