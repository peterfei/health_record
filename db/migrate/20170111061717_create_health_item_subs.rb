class CreateHealthItemSubs < ActiveRecord::Migration[5.0]
  def change
  	remove_column :health_items, :normal_max
  	remove_column :health_items, :normal_min
  	remove_column :health_items, :subitem
  	add_column :health_items, :normal_max, :float, {comment: "正常最大值"}
  	add_column :health_items, :normal_min, :float, {comment: "正常最小值"}
    create_table :health_item_subs do |t|
    	t.string :name, comment: "子项目名称"
    	t.string :sub_unit, comment: "子项目单位"
    	t.float :sub_max, comment: "子项目正常最大值"
    	t.float :sub_min, comment: "子项目正常最小值"
    	t.references :health_item, foreign_key: true

      t.timestamps
    end
  end
end
