class CreateActualRecipeReqs < ActiveRecord::Migration[5.1]
  def change
    create_table :actual_recipe_reqs do |t|
      t.integer :qty
      t.references :surgery_appt, foreign_key: true
      t.references :supply_list, foreign_key: true

      t.timestamps
    end
  end
end
