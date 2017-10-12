class SupplyList < ApplicationRecord
  has_many :surgery_recipe_reqs
  has_many :actual_recipe_reqs
  has_many :inventories

  validates :item_name, presence: true
  validates :item_name, uniqueness: true

end
