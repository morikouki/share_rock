class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.string :image_id
      t.string :title
      t.text :explanation
      t.string :prefectures
      t.string :address_city
      t.date :event_date
      t.timestamps
    end
  end
end
