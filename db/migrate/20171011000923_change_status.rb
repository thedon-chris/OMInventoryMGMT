class ChangeStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :surgery_appts, :status, :boolean, :default => true
  end
end
