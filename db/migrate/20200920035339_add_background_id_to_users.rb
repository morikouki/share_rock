class AddBackgroundIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :background_id, :string
  end
end
