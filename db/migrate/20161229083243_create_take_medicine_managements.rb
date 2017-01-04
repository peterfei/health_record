class CreateTakeMedicineManagements < ActiveRecord::Migration[5.0]
  def change
    create_table :take_medicine_managements do |t|
    	t.string :name, comment:"药品名称"
    	t.string :usage, comment:"用法"
    	t.string :dosage, comment:"用量"
    	t.references :user, foreign_key: true
    	
      t.timestamps
    end
  end
end
