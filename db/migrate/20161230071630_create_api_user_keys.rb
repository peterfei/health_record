class CreateApiUserKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_user_keys do |t|
    	t.string :access_token, :unique, comment:"登录口令"
    	t.datetime :expires_at, comment:"过期时间"
    	t.integer :active
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
