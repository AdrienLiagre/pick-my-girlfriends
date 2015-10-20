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

      t.timestamps null: false
    end
  end
end
