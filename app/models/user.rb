class User < ApplicationRecord
  require "digest/sha1"

  has_many :api_user_keys, dependent: :destroy
  has_one :user_vip, dependent: :destroy
  has_many :user_focus, dependent: :destroy
  has_many :health_items, dependent: :destroy
  has_many :medical_record_managements, dependent: :destroy
  has_many :take_medicine_managements, dependent: :destroy
  acts_as_taggable_on :hobby, :job, :speciality, :skill_level
  enum sex: [:unknown,:male, :female]
  enum id_type: [:identity, :passport, :officer, :other_id]
  enum blood_type: [:type_a, :type_b, :type_ab, :type_o, :type_other]
  enum children: [:zero, :one, :two, :three, :more]
  enum education: [:primary, :middle, :high, :bachelor, :master, :doctor]
  before_create :_hashed_password
  before_update :_hashed_password
  after_create :_create_item_user

  def attributes &block
    if block
      super.merge(sex: I18n.t("user.sex.#{self.sex}"),
            id_type: I18n.t("user.id_type.#{self.id_type}"),
            blood_type: I18n.t("user.blood_type.#{self.blood_type}"),
            children: I18n.t("user.children.#{self.children}"),
            education: I18n.t("user.education.#{self.education}"),
            hobby_list: hobby_list.join(","),
            speciality_list: speciality_list.join(","),
            job_list: job_list.join(","),
            skill_level_list: skill_level_list.join(","),
            user_vip_info: user_vip_info)
    else
      super.merge(sex: User.sexes[self.sex],
            id_type: User.id_types[self.id_type],
            blood_type: User.blood_types[self.blood_type],
            children: User.children[self.children],
            education: User.educations[self.education],
            hobby_list: hobby_list.join(","),
            speciality_list: speciality_list.join(","),
            job_list: job_list.join(","),
            skill_level_list: skill_level_list.join(","),
            user_vip_info: user_vip_info)
    end
  end

  def user_vip_info
    User.find(self.id).user_vip rescue nil
  end

  def valid_password? password
      if Digest::SHA1.hexdigest(password)==self.password
          true
      else
          false
      end
  end

  private
    #密码加密
    def _hashed_password
      self.password = Digest::SHA1.hexdigest(self.password)
    end

    def _create_item_user
      helth_item=HealthItem.where("is_admin=1 AND user_id IS NULL")
      helth_item.each do |item|
        @h = HealthItem.create! name:item.name,
                 unit:item.unit,
                 is_check:1,
                 user_id:self.id,
                 is_admin:1,
                 normal_max:item.normal_max,
                 normal_min:item.normal_min,
                 value_range:item.value_range,
                 icon: item.icon,
                 icon_bgcolor: item.icon_bgcolor
        @health_item_subs = item.health_item_subs
        if @health_item_subs.present?
          @health_item_subs.each do |sub|
            HealthItemSub.create! name: sub.name,
              sub_unit: sub.sub_unit,
              sub_max: sub.sub_max,
              sub_min: sub.sub_min,
              health_item_id: @h.id,
              sub_value_range: sub.sub_value_range
          end
        end
      end
    end
end
