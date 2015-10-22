class RemoveLocationFromGirlfriends < ActiveRecord::Migration
  def change
    remove_column :girlfriends, :location, :string
  end
end
