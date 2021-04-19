class AddNameToRestrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :restrooms, :name, :string
  end
end
