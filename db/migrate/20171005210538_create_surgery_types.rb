class CreateSurgeryTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :surgery_types do |t|
      t.string :surgery_name

      t.timestamps
    end
  end
end
