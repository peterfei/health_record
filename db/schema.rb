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

ActiveRecord::Schema.define(version: 20170105032309) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "role",                                             comment: "角色"
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  end

  create_table "api_user_keys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "access_token",              comment: "登录口令"
    t.datetime "expires_at",                comment: "过期时间"
    t.integer  "active"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["access_token"], name: "index_api_user_keys_on_access_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_api_user_keys_on_user_id", using: :btree
  end

  create_table "health_item_attentions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "item_attention_time",              comment: "提醒时间"
    t.integer  "health_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["health_item_id"], name: "index_health_item_attentions_on_health_item_id", using: :btree
  end

  create_table "health_item_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",                     comment: "数据内容"
    t.integer  "health_item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["health_item_id"], name: "index_health_item_records_on_health_item_id", using: :btree
  end

  create_table "health_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                    comment: "名称"
    t.string   "unit",                    comment: "单位"
    t.integer  "is_check",                comment: "是否开启项目数据记录"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "normal",                  comment: "正常值"
    t.index ["user_id"], name: "index_health_items_on_user_id", using: :btree
  end

  create_table "medical_record_managements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                    comment: "病历名称"
    t.string   "image_path",              comment: "病历图片路径"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medical_record_managements_on_user_id", using: :btree
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "var",                      null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",                       collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "take_medicine_attentions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "medicine_attention_time",                  comment: "提醒时间"
    t.integer  "take_medicine_management_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["take_medicine_management_id"], name: "index_take_medicine_attentions_on_take_medicine_management_id", using: :btree
  end

  create_table "take_medicine_managements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                    comment: "药品名称"
    t.string   "usage",                   comment: "用法"
    t.string   "dosage",                  comment: "用量"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_take_medicine_managements_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",                comment: "账号"
    t.string   "password",                comment: "密码"
    t.string   "truename",                comment: "姓名"
    t.integer  "sex",                     comment: "性别"
    t.integer  "age",                     comment: "年龄"
    t.integer  "blood_type",              comment: "血型"
    t.integer  "children",                comment: "子女数"
    t.string   "wx_id",                   comment: "微信ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "openid",     null: false
    t.string   "hash_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["openid"], name: "index_wechat_sessions_on_openid", unique: true, using: :btree
  end

  add_foreign_key "api_user_keys", "users"
  add_foreign_key "health_item_attentions", "health_items"
  add_foreign_key "health_item_records", "health_items"
  add_foreign_key "health_items", "users"
  add_foreign_key "medical_record_managements", "users"
  add_foreign_key "take_medicine_attentions", "take_medicine_managements"
  add_foreign_key "take_medicine_managements", "users"
end
