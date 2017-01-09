module API
  module V1
    class Base < Grape::API
      mount API::V1::Users
      mount API::V1::HealthItems
      mount API::V1::HealthItemAttentions
      mount API::V1::MedicalRecordManagements
      mount API::V1::TakeMedicineManagements
      mount API::V1::TakeMedicineAttentions
      mount API::V1::Commons
      mount API::V1::UserFocus
    end
  end
end
