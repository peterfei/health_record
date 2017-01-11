class DropTableUserVips < ActiveRecord::Migration[5.0]
  def change
  	drop_table :user_vips
  	create_table :user_vips do |t|
	    	t.string :card_number, comment: "会员卡号"
	    	t.string :barcode_image_path, comment: "会员条码"
	    	t.string :vip_score, comment: "会员积分"
	    	t.references :user, foreign_key: true

	      t.timestamps
    end
  end
end
