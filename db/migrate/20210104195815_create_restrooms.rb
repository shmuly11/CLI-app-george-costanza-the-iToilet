class CreateRestrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :restrooms do |t|
      t.integer :area_id
      t.string :address
      t.boolean :free
      t.timestamps
  end
end
end