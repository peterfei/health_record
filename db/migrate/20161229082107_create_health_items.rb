class CreateHealthItems < ActiveRecord::Migration[5.0]
  def change
    create_table :health_items do |t|
    	t.string :name, comment:"名称"
    	t.string :unit, comment:"单位"
    	t.integer :is_check, comment:"是否开启项目数据记录"
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
