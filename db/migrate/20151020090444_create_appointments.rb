class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :status
      t.date :appointment_on

      t.timestamps null: false
      t.integer :client_id, index: true
      t.references :girlfriend
    end

    add_foreign_key :appointments, :users, column: :client_id
  end
end

