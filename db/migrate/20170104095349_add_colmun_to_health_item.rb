class AddColmunToHealthItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :medical_record_managements, :category
    add_column :health_items, :normal, :integer, {comment:"正常值"}
  end
end
