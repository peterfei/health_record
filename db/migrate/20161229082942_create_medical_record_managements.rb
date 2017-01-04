class CreateMedicalRecordManagements < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_record_managements do |t|
    	t.string :name, comment:"病历名称"
    	t.integer :category, comment:"分类"
    	t.string :image_path, comment:"病历图片路径"
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
