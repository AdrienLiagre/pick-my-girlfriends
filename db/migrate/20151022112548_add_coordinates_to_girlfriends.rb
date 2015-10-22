class AddCoordinatesToGirlfriends < ActiveRecord::Migration
  def change
    add_column :girlfriends, :latitude, :float
    add_column :girlfriends, :longitude, :float
  end
end
