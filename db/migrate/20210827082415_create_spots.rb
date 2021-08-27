class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.string :spot_name
      t.string :address
      t.text :comment
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
