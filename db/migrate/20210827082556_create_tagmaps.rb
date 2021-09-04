class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.references :spot, type: :bigint, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
