class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :username, comment:"账号"
    	t.string :password, comment:"密码"
    	t.string :truename, comment:"姓名"
    	t.integer :sex, comment:"性别"
    	t.integer :age, comment:"年龄"
    	t.integer :blood_type, comment:"血型"
    	t.integer :children, comment:"子女数"
    	t.string :wx_id, comment:"微信ID"

      t.timestamps
    end
  end
end
