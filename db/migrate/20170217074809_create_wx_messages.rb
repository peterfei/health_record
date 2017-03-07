class CreateWxMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :wx_messages do |t|
      t.string :title , comment:'标题'
      t.string :description, comment:'描述'
      t.string :content, comment:'内容'
      t.string :pic_url, comment:'配图链接'
      t.string :url, comment:'跳转链接'
      t.string :media_id, comment:'微信多媒体文件ID'
      t.integer :type,comment:'类型'
      t.timestamps
    end
  end
end
