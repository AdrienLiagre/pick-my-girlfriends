class AddPictureToGirlfriends < ActiveRecord::Migration
  def change
    add_foreign_key :girlfriends, :users, column: :pimp_id
    add_attachment :girlfriends, :picture
  end
end
