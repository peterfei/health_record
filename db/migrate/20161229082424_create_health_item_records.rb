class CreateHealthItemRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :health_item_records do |t|
    	t.string :content, comment:"数据内容"
    	t.references :health_item, foreign_key: true

      t.timestamps
    end
  end
end
