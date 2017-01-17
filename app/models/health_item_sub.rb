class HealthItemSub < ApplicationRecord
	belongs_to :health_item

	validates :name, :sub_value_range, presence: {message:'不能为空'}
	validates_uniqueness_of :name, scope: :health_item_id, message: "不能重复"
end
