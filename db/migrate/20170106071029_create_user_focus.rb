class CreateUserFocus < ActiveRecord::Migration[5.0]
  def change
    create_table :user_focus do |t|
      t.string :appellation, comment:"称呼"
      t.integer :whether, comment:"关注状态，0为失败，1为成功，2为忽略"
      t.integer :follow_id, comment:"被关注者id"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
