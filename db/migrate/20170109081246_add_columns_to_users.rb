class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :nation, :string, {comment:"民族"}
  	add_column :users, :id_type, :integer, {comment:"证件类型"}
  	add_column :users, :id_code, :string, {comment:"证件号码"}
  	add_column :users, :education, :integer, {comment:"最高学历"}
  	add_column :users, :duty, :string,  {comment:"职务"}
  end
end
