class HealthItem < ApplicationRecord
	belongs_to :user
	has_many :health_item_records
	has_many :health_item_attentions

	enum is_check:[:cancel, :checked]
	enum item_type:[:jk, :bl]
end
