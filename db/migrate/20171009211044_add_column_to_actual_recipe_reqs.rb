class AddColumnToActualRecipeReqs < ActiveRecord::Migration[5.1]
  def change
    add_reference :actual_recipe_reqs, :surgery_type, foreign_key: true
  end
end
