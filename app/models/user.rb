class User < ApplicationRecord
	has_many :api_user_keys
	has_many :health_items
	has_many :user_focus
	has_many :medical_record_managements
	has_many :take_medicine_managements

	acts_as_taggable_on :hobby, :job
	enum sex:[:male, :female]
	enum blood_type:[:type_a, :type_b, :type_ab, :type_o, :type_other]
	enum children:[:zero, :one, :two, :three, :more]
end
