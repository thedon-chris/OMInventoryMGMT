class RenameColumnSurgeryAppts < ActiveRecord::Migration[5.1]
  def change
    rename_column :surgery_appts, :status, :complete

  end
end
