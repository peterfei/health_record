class CreateTakeMedicineAttentions < ActiveRecord::Migration[5.0]
  def change
    create_table :take_medicine_attentions do |t|
    	t.datetime :medicine_attention_time, comment:"提醒时间"
    	t.references :take_medicine_management, foreign_key: true

      t.timestamps
    end
  end
end
