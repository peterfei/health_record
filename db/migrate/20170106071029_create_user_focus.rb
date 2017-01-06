class CreateUserFocus < ActiveRecord::Migration[5.0]
  def change
    create_table :user_focus do |t|
      t.string :appellation, coomment:"称呼"
      t.integer :whether, coomment:"关注状态，0为失败，1为成功"
      t.integer :follow_id, coomment:"被关注者id"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
