class WxMessageForTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :wx_messages,:type,:message_type
  end
end
