class AddAddressToGirlfriends < ActiveRecord::Migration
  def change
    add_column :girlfriends, :street, :string
    add_column :girlfriends, :postcode, :string
    add_column :girlfriends, :city, :string
  end
end
