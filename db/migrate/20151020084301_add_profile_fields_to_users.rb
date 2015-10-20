class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_attachment :users, :picture
  end
end
