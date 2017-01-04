class AddIndexToApiUserKey < ActiveRecord::Migration[5.0]
  def change
  	remove_column :api_user_keys, :unique
  	add_index :api_user_keys, :access_token, :unique => true
  end
end
