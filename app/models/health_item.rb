class HealthItem < ApplicationRecord
	belongs_to :user
	has_many :health_item_subs, dependent: :destroy
	has_many :health_item_records, dependent: :destroy
	has_many :health_item_attentions, dependent: :destroy

	enum is_check:[:cancel, :checked]

	validates :name, presence: {message:'不能为空'}
	validates_uniqueness_of :name, scope: :user_id, message: "不能重复"
	validates :value_range, presence:{message:'不能为空'}

	def attributes
		super.merge(subitems: subitems)
	end

	def subitems
		self.health_item_subs rescue nil
	end
end
