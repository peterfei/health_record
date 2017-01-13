	class User < ApplicationRecord
	has_many :api_user_keys
	has_one :user_vip
	has_many :user_focus
	has_many :health_items
	has_many :medical_record_managements
	has_many :take_medicine_managements

	acts_as_taggable_on :hobby, :job, :speciality, :skill_level
	enum sex: [:male, :female]
	enum id_type: [:identity, :passport, :officer, :other_id]
	enum blood_type: [:type_a, :type_b, :type_ab, :type_o, :type_other]
	enum children: [:zero, :one, :two, :three, :more]
	enum education: [:primary, :middle, :high, :bachelor, :master, :doctor]
  after_create :_create_item_user

    private
      def _create_item_user
        helth_item=HealthItem.where("is_admin=1").group("name")
        helth_item.each do |item|
          HealthItem.create! name:item.name,
                             unit:item.unit,
                             is_check:item.is_check,
                             user_id:self.id,
                             is_admin:0,
                             normal_max:item.normal_max,
                             normal_min:item.normal_min
        end
      end
end
