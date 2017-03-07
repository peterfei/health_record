class ChangeColumnCodeTypeToWxCode < ActiveRecord::Migration[5.0]
  def change
    change_column :wx_codes,:code_type,:integer
  end
end
