class ChangeColumnToUserVips < ActiveRecord::Migration[5.0]
  def change
  	remove_column :user_vips, :vip_score
  	add_column :user_vips, :vip_score, :integer, {default:0, comment: "会员积分"}
  end
end
