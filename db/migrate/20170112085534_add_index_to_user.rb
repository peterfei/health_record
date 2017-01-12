class AddIndexToUser < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :wx_id, {:unique=>true}
  end
end
