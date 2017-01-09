class CreateUserVips < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :wx_name, :string, { comment: "微信名称" }
  	add_column :users, :wx_avatar, :string, { comment: "微信头像" }
    create_table :user_vips do |t|
    	t.string :card_number, :integer, comment: "会员卡号"
    	t.string :barcode_image_path, :string, comment: "会员二维码"
    	t.string :vip_score, :integer, comment: "会员积分"
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
