class AddThumbImagePathToMedicalRecordManagement < ActiveRecord::Migration[5.0]
  def change
    add_column :medical_record_managements, :thumb_image_path, :string
  end
end
