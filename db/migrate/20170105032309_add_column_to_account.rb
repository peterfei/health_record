class AddColumnToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :role, :integer, {comment:"角色"}
  end
end
