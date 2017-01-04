class AddColumnToAccounts < ActiveRecord::Migration[5.0]
  def change
  	add_column :accounts, :username, :string, :unique=> true
  	remove_index :accounts, :email
  end
end
