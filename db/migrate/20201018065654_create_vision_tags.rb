class CreateVisionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :vision_tags do |t|
      t.integer :event_id
      t.integer :profile_image_id
      t.string :name

      t.timestamps
    end
  end
end
