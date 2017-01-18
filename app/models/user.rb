class User < ApplicationRecord
	has_many :api_user_keys, dependent: :destroy
	has_one :user_vip, dependent: :destroy
	has_many :user_focus, dependent: :destroy
	has_many :health_items, dependent: :destroy
	has_many :medical_record_managements, dependent: :destroy
	has_many :take_medicine_managements, dependent: :destroy

	acts_as_taggable_on :hobby, :job, :speciality, :skill_level
	enum sex: [:male, :female]
	enum id_type: [:identity, :passport, :officer, :other_id]
	enum blood_type: [:type_a, :type_b, :type_ab, :type_o, :type_other]
	enum children: [:zero, :one, :two, :three, :more]
	enum education: [:primary, :middle, :high, :bachelor, :master, :doctor]
	after_create :_create_item_user

	def attributes(&block)
		if block
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
		else
			super
		end
	end

	def user_vip_info
		User.find(self.id).user_vip rescue nil
	end

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
