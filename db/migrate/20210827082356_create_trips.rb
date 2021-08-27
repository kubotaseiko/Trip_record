class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :location
      t.string :period
      t.text :comment

      t.timestamps
    end
  end
end
