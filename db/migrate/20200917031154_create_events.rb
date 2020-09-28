class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.string :image_id
      t.string :title
      t.text :explanation
      t.string :prefecture_code
      t.string :city
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
