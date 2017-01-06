class ChangeColumnsToAttentions < ActiveRecord::Migration[5.0]
  def change
  	remove_column :health_item_attentions, :item_attention_time
  	remove_column :take_medicine_attentions, :medicine_attention_time
  	add_column :health_item_attentions, :item_attention_time, :string, {comment: "提醒时间"}
  	add_column :take_medicine_attentions, :medicine_attention_time, :string, {comment: "提醒时间"}
  end
end
