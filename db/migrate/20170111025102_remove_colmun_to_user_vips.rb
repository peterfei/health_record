class RemoveColmunToUserVips < ActiveRecord::Migration[5.0]
  def change
        remove_column :user_vips, :barcode_image_path
  end
end
