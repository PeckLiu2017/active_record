class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :physician_id
      t.string :patient_id
      t.datetime :appointment_data

      t.timestamps
    end
    add_index :appointments, :physician_id
    add_index :appointments, :patient_id
  end
end
