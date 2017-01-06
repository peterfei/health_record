class ChangeColumnsToHealthItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :health_items, :normal
  	add_column :health_items, :is_admin, :integer, { comment: "是否为系统默认项目" }
  	add_column :health_items, :normal_min, :integer, { comment: "正常最小值" }
  	add_column :health_items, :normal_max, :integer, { comment: "正常最大值" }
  end
end
