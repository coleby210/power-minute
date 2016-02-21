class CreateGroupComments < ActiveRecord::Migration
  def change
    create_table :group_comments do |t|
      t.integer :member_id, null: false
      t.integer :group_id, null: false
      t.string :comment_text, null: false

      t.timestamps null: false
    end
  end
end
