class RemoveAreaIdAndFreeFromRestrooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :restrooms, :area_id, :integer
    remove_column :restrooms, :free, :boolean
  end
end
