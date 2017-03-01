class AddStatusColumnForWxMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :wx_messages,:status,:integer,{comment:'启用状态'}
  end
end
