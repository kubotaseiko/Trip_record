class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id, null: false
      t.string :spot_name, null: false
      t.string :address
      t.text :comment
      t.text :site_url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
