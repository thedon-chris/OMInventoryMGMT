class ChangeDefaultValueOfSurgeryAppt < ActiveRecord::Migration[5.1]
  def change
    change_column :surgery_appts, :complete, :boolean, :default => false

  end
end
