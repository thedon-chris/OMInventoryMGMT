class AddColumnToSurgeryAppt < ActiveRecord::Migration[5.1]
  def change
    add_column :surgery_appts, :status, :boolean
  end
end
