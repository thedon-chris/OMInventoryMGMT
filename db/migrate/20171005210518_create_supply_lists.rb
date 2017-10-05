class CreateSupplyLists < ActiveRecord::Migration[5.1]
  def change
    create_table :supply_lists do |t|
      t.string :item_name

      t.timestamps
    end
  end
end
