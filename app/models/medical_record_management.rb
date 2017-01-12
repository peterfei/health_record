class MedicalRecordManagement < ApplicationRecord
	# wechat_api
	belongs_to :user

	acts_as_taggable_on :category
	before_save :_save_img
	
	private
	# @return [转化ServerID保存]
	def _save_img

	end
end
