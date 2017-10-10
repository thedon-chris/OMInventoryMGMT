class RemoveColumnFromActualRecipeReq < ActiveRecord::Migration[5.1]
  def change
    remove_column :actual_recipe_reqs, :surgery_type_id, :integer
  end
end
