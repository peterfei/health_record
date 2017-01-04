class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :medical_record_managements, :category
    add_column :medical_record_managements, :category_id, :integer
    add_index :medical_record_managements, :category_id, :unique => true
    create_table :categories do |t|
      t.string :name, comment:"分类名称"

      t.timestamps
    end

  end
end
