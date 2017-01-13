class AddColumnsToHealthItemsHealthItemSubs < ActiveRecord::Migration[5.0]
  def change
  	add_column :health_items, :value_range, :string, {comment: "取值范围"}
  	add_column :health_item_subs, :sub_value_range, :string, {comment: "子项目取值范围"}
  end
end
