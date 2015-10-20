class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :appointment, index: true, foreign_key: true
      t.text :description
      t.integer :stars

      t.timestamps null: false
    end
  end
end
