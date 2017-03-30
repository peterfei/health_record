class ChangeUserIdAccountIdFromSSO < ActiveRecord::Migration[5.0]
  def change
  	rename_column :user_ssos,:user_id,:account_id
  end
end
