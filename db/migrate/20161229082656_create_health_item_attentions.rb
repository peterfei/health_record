class CreateHealthItemAttentions < ActiveRecord::Migration[5.0]
  def change
    create_table :health_item_attentions do |t|
    	t.datetime :item_attention_time, comment:"提醒时间"
    	t.references :health_item, foreign_key: true

      t.timestamps
    end
  end
end
