class AddColumnToHealthItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :health_items, :subitem, :string, {comment: "子项目"}
  end
end
