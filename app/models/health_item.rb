class HealthItem < ApplicationRecord
	belongs_to :user
	has_many :health_item_subs, dependent: :destroy
	has_many :health_item_records, dependent: :destroy
	has_many :health_item_attentions, dependent: :destroy

	enum is_check:[:cancel, :checked]

	validates :name, presence: {message:'不能为空'}, uniqueness:{message:'不能重复'}, on: :create
	validates :value_range, presence:{message:'不能为空'}

	def attributes
		super.merge(subitems: subitems)
	end

	def subitems
		self.health_item_subs rescue nil
	end
end
