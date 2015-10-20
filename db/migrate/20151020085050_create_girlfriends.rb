class CreateGirlfriends < ActiveRecord::Migration
  def change
    create_table :girlfriends do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :age
      t.boolean :availability, default: true
      t.string :location
      t.string :nationality
      t.string :job
      t.integer :pimp_id, index: true

      t.timestamps null: false
    end

    # add_foreign_key :girlfriends, :users, column: :pimp_id
  end
end
