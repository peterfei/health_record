class AddColumnsToHealthItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :health_items, :icon, :string, {comment: "图标"}
  	add_column :health_items, :icon_bgcolor, :string, {comment: "图标背景色"}
  end
end
