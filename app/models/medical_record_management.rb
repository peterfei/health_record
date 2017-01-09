class MedicalRecordManagement < ApplicationRecord
	belongs_to :user

	acts_as_taggable_on :category
end
