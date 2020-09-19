class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :post_image_id
      t.text :post_text

      t.timestamps
    end
  end
end
