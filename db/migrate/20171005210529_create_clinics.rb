class CreateClinics < ActiveRecord::Migration[5.1]
  def change
    create_table :clinics do |t|
      t.string :clinic_name

      t.timestamps
    end
  end
end
