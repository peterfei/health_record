class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users,:mark,:string,comment:'推广标记'
  end
end
