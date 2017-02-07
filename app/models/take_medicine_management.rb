class TakeMedicineManagement < ApplicationRecord
	belongs_to :user
	has_many :take_medicine_attentions, dependent: :destroy
end
