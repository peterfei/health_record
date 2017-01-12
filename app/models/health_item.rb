class HealthItem < ApplicationRecord
	belongs_to :user
	has_many :health_item_subs
	has_many :health_item_records
	has_many :health_item_attentions

	enum is_check:[:cancel, :checked]

	def attributes
		super.merge(subitems: subitems)
	end

	def subitems
		self.health_item_subs rescue nil
	end
end
