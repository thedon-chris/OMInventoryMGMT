class CreateSurgeryAppts < ActiveRecord::Migration[5.1]
  def change
    create_table :surgery_appts do |t|
      t.date :surgery_date
      t.references :clinic, foreign_key: true
      t.references :surgery_type, foreign_key: true

      t.timestamps
    end
  end
end
