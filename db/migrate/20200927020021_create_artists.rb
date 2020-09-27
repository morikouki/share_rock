class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :user_id
      t.string :like_artist

      t.timestamps
    end
  end
end
