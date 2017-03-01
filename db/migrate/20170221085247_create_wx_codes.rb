class CreateWxCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :wx_codes do |t|
      t.string :title,comment:'名称'
      t.integer :expire_time,comment:'二维码到期时间'
      t.string :url,comment:'二维码解析地址'
      t.string :ticket,comment:'二维码的ticket'
      t.string :code_type,comment:'二维码类型（永久或临时）'
      t.integer :scence_id,comment:'二维码场景ID（数字类型参数）'
      t.string :scence_str,comment:'二维码场景ID（字符串类型参数）'
      t.timestamps
    end
  end
end
