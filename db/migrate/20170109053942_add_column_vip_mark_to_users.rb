class AddColumnVipMarkToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :vip_mark, :integer, {default:0, comment: "是否是VIP:0不是，1是"}
  end
end
