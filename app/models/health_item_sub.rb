class HealthItemSub < ApplicationRecord
	belongs_to :health_item

	validates :name, :sub_value_range, presence: {message:'不能为空'}
end
