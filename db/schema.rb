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

ActiveRecord::Schema.define(version: 20170330050415) do

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

  create_table "bbs_basics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "bbs_name",                                    comment: "社区名称"
    t.string   "bbs_desc",                                    comment: "社区简介"
    t.string   "bbs_img",                                     comment: "社区头像"
    t.string   "bbs_link",                                    comment: "社区链接地址"
    t.integer  "bbs_super_user",                              comment: "社区创建者ID"
    t.integer  "bbs_visit_count", default: 3000,              comment: "社区访问量"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "health_item_attentions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "health_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "item_attention_time",              comment: "提醒时间"
    t.index ["health_item_id"], name: "index_health_item_attentions_on_health_item_id", using: :btree
  end

  create_table "health_item_records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content",                     comment: "数据内容"
    t.integer  "health_item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["health_item_id"], name: "index_health_item_records_on_health_item_id", using: :btree
  end

  create_table "health_item_subs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                    comment: "子项目名称"
    t.string   "sub_unit",                                comment: "子项目单位"
    t.float    "sub_max",         limit: 24,              comment: "子项目正常最大值"
    t.float    "sub_min",         limit: 24,              comment: "子项目正常最小值"
    t.integer  "health_item_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "sub_value_range",                         comment: "子项目取值范围"
    t.index ["health_item_id"], name: "index_health_item_subs_on_health_item_id", using: :btree
  end

  create_table "health_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                              comment: "名称"
    t.string   "unit",                                              comment: "单位"
    t.integer  "is_check",                                          comment: "是否开启项目数据记录"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "is_admin",                                          comment: "是否为系统默认项目"
    t.float    "normal_max",   limit: 24,                           comment: "正常最大值"
    t.float    "normal_min",   limit: 24,                           comment: "正常最小值"
    t.string   "value_range",                                       comment: "取值范围"
    t.string   "icon",                                              comment: "图标"
    t.string   "icon_bgcolor",            default: "",              comment: "图标背景色"
    t.index ["user_id"], name: "index_health_items_on_user_id", using: :btree
  end

  create_table "medical_record_managements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          comment: "病历名称"
    t.string   "image_path",                    comment: "病历图片路径"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "thumb_image_path"
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
    t.integer  "take_medicine_management_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "medicine_attention_time",                  comment: "提醒时间"
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

  create_table "user_focus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "appellation",              comment: "称呼"
    t.integer  "whether",                  comment: "处理结果：0为未处理，1为同意，2为忽略"
    t.integer  "follow_id",                comment: "被关注人ID"
    t.integer  "user_id",                  comment: "请求关注人ID"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_user_focus_on_user_id", using: :btree
  end

  create_table "user_ssos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "account_id",                 null: false
    t.string   "uid",                        null: false
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.string   "avatar_url"
    t.text     "last_payload", limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["uid"], name: "index_user_ssos_on_uid", unique: true, using: :btree
  end

  create_table "user_vips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "card_number",                          comment: "会员卡号"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "vip_score",   default: 0,              comment: "会员积分"
    t.index ["user_id"], name: "index_user_vips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",                            comment: "账号"
    t.string   "password",                            comment: "密码"
    t.string   "truename",                            comment: "姓名"
    t.integer  "sex",                                 comment: "性别"
    t.integer  "age",                                 comment: "年龄"
    t.integer  "blood_type",                          comment: "血型"
    t.integer  "children",                            comment: "子女数"
    t.string   "wx_id",                               comment: "微信ID"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "wx_name",                             comment: "微信名称"
    t.string   "wx_avatar",                           comment: "微信头像"
    t.integer  "vip_mark",   default: 0,              comment: "是否是VIP:0不是，1是"
    t.string   "nation",                              comment: "民族"
    t.integer  "id_type",                             comment: "证件类型"
    t.string   "id_code",                             comment: "证件号码"
    t.integer  "education",                           comment: "最高学历"
    t.string   "duty",                                comment: "职务"
    t.string   "mark",                                comment: "推广标记"
    t.index ["wx_id"], name: "index_users_on_wx_id", unique: true, using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  create_table "wechat_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "openid",     null: false
    t.string   "hash_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["openid"], name: "index_wechat_sessions_on_openid", unique: true, using: :btree
  end

  create_table "wx_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                    comment: "名称"
    t.integer  "expire_time",              comment: "二维码到期时间"
    t.string   "url",                      comment: "二维码解析地址"
    t.string   "ticket",                   comment: "二维码的ticket"
    t.integer  "code_type"
    t.integer  "scence_id",                comment: "二维码场景ID（数字类型参数）"
    t.string   "scence_str",               comment: "二维码场景ID（字符串类型参数）"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "code_name"
    t.string   "code_url"
  end

  create_table "wx_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                     comment: "标题"
    t.string   "description",               comment: "描述"
    t.string   "content",                   comment: "内容"
    t.string   "pic_url",                   comment: "配图链接"
    t.string   "url",                       comment: "跳转链接"
    t.string   "media_id",                  comment: "微信多媒体文件ID"
    t.integer  "message_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "status",                    comment: "启用状态"
  end

  add_foreign_key "api_user_keys", "users"
  add_foreign_key "health_item_attentions", "health_items"
  add_foreign_key "health_item_records", "health_items"
  add_foreign_key "health_item_subs", "health_items"
  add_foreign_key "health_items", "users"
  add_foreign_key "medical_record_managements", "users"
  add_foreign_key "take_medicine_attentions", "take_medicine_managements"
  add_foreign_key "take_medicine_managements", "users"
  add_foreign_key "user_focus", "users"
  add_foreign_key "user_vips", "users"
end
