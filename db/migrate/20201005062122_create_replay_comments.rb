class CreateReplayComments < ActiveRecord::Migration[5.2]
  def change
    create_table :replay_comments do |t|
      t.integer :post_comment_id
      t.integer :post_id
      t.integer :user_id
      t.integer :event_id
      t.string :comment

      t.timestamps
    end
  end
end
