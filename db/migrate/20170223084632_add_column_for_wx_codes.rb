class AddColumnForWxCodes < ActiveRecord::Migration[5.0]
  def change
    add_column :wx_codes,:code_name,:string
    add_column :wx_codes,:code_url,:string
  end
end
