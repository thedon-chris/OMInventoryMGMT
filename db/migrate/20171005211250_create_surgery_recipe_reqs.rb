class CreateSurgeryRecipeReqs < ActiveRecord::Migration[5.1]
  def change
    create_table :surgery_recipe_reqs do |t|
      t.integer :qty
      t.references :supply_list, foreign_key: true
      t.references :surgery_type, foreign_key: true

      t.timestamps
    end
  end
end
