# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130220185111) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "date_posted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "branches", force: true do |t|
    t.string   "char"
    t.string   "pinyin"
    t.string   "animal"
    t.integer  "native_stem_id"
    t.string   "normalized"
    t.integer  "hour"
    t.integer  "month"
    t.string   "slug"
    t.text     "description"
    t.integer  "ordinal"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "chart_palaces", force: true do |t|
    t.integer  "chart_id"
    t.integer  "palace_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "chart_palaces", ["chart_id"], name: "index_chart_palaces_on_chart_id"
  add_index "chart_palaces", ["palace_id"], name: "index_chart_palaces_on_palace_id"

  create_table "chart_stars", force: true do |t|
    t.integer  "chart_id"
    t.integer  "star_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charts", force: true do |t|
    t.datetime "solar_date"
    t.integer  "year_id"
    t.integer  "month_id"
    t.integer  "day_id"
    t.integer  "hour_id"
    t.string   "inner_element"
    t.integer  "lunar_year"
    t.integer  "lunar_month"
    t.integer  "day_of_month"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "ming_id"
    t.integer  "zi_wei_id"
    t.integer  "tian_fu_id"
    t.integer  "tian_xiang_id"
    t.integer  "tian_ji_id"
    t.integer  "tai_yang_id"
    t.integer  "wu_qu_id"
    t.integer  "tai_yin_id"
    t.integer  "ju_men_id"
    t.integer  "tian_tong_id"
    t.integer  "tian_liang_id"
    t.integer  "wen_chang_id"
    t.integer  "wen_qu_id"
    t.integer  "lian_zhen_id"
    t.integer  "tan_lang_id"
    t.integer  "qi_sha_id"
    t.integer  "po_jun_id"
    t.integer  "huo_xing_id"
    t.integer  "ling_xing_id"
    t.integer  "yang_ren_id"
    t.integer  "tuo_luo_id"
    t.integer  "you_bi_id"
    t.integer  "zuo_fu_id"
    t.integer  "tian_cun_id"
    t.integer  "tian_yao_id"
    t.integer  "tian_kui_id"
    t.integer  "tian_xi_id"
    t.integer  "di_gong_id"
    t.integer  "tian_yue_id"
    t.integer  "tian_xing_id"
    t.integer  "di_jie_id"
    t.integer  "yi_ma_id"
    t.integer  "wood_score"
    t.integer  "fire_score"
    t.integer  "earth_score"
    t.integer  "metal_score"
    t.integer  "water_score"
    t.boolean  "leap"
    t.integer  "lunar_month_number"
  end

  add_index "charts", ["hour_id"], name: "index_charts_on_hour_id"
  add_index "charts", ["slug"], name: "index_charts_on_slug", unique: true
  add_index "charts", ["solar_date"], name: "index_charts_on_solar_date", unique: true
  add_index "charts", ["year_id"], name: "index_charts_on_year_id"

  create_table "comments", force: true do |t|
    t.integer  "member_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "comments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_id", "commentable_type", "member_id"], name: "comments_finder_index"

  create_table "elements", force: true do |t|
    t.string   "name"
    t.integer  "ordinal"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "member_id"
    t.string   "subject"
    t.text     "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jieqi_dates", force: true do |t|
    t.integer  "jieqi_id"
    t.datetime "start_date"
    t.integer  "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jieqi_dates", ["start_date"], name: "index_jieqi_dates_on_start_date"

  create_table "jieqis", force: true do |t|
    t.string   "chinese"
    t.string   "pinyin"
    t.string   "english"
    t.string   "slug"
    t.integer  "solar_longitude"
    t.integer  "ordinal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lunar_dates", force: true do |t|
    t.date     "gregorian_date"
    t.integer  "epoch"
    t.integer  "year_in_epoch"
    t.integer  "month_number"
    t.boolean  "leap_month"
    t.integer  "day_of_month"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "lunar_dates", ["gregorian_date"], name: "index_lunar_dates_on_gregorian_date"

  create_table "lunar_years", force: true do |t|
    t.integer  "year_number"
    t.datetime "start_date"
    t.string   "yin_yang"
    t.integer  "hexagram_cycle_starting_point"
    t.integer  "days_in_year"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "members", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["authentication_token"], name: "index_members_on_authentication_token", unique: true
  add_index "members", ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true
  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  add_index "members", ["unlock_token"], name: "index_members_on_unlock_token", unique: true

  create_table "palaces", force: true do |t|
    t.string   "name"
    t.integer  "ordinal"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "dob"
    t.integer  "member_id"
    t.string   "slug"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "chart_id"
    t.string   "yin_yang"
    t.integer  "year_branch_id"
    t.integer  "hour_branch_id"
  end

  create_table "pillars", force: true do |t|
    t.integer  "stem_id"
    t.integer  "branch_id"
    t.string   "slug"
    t.text     "description"
    t.integer  "ordinal"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "star_groups", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "star_palaces", force: true do |t|
    t.integer  "star_id"
    t.integer  "palace_id"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "star_relationship_stars", force: true do |t|
    t.integer  "star_relationship_id"
    t.integer  "star_id"
    t.integer  "palace_id"
    t.boolean  "required"
    t.integer  "member_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "star_relationship_stars", ["star_id", "member_id", "palace_id"], name: "idx_srs_mega_index"
  add_index "star_relationship_stars", ["star_relationship_id"], name: "index_star_relationship_stars_on_star_relationship_id"

  create_table "star_relationships", force: true do |t|
    t.integer  "palace_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ordinal"
  end

  add_index "star_relationships", ["palace_id", "member_id"], name: "index_star_relationships_on_palace_id_and_member_id"

  create_table "stars", force: true do |t|
    t.string   "pinyin"
    t.string   "english"
    t.string   "description"
    t.integer  "rank"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stems", force: true do |t|
    t.string   "char"
    t.string   "pinyin"
    t.string   "yin_yang"
    t.string   "element"
    t.string   "slug"
    t.string   "normalized"
    t.text     "description"
    t.integer  "ordinal"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
