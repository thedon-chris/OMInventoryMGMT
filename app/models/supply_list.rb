class SupplyList < ApplicationRecord
  has_many :surgery_recipe_reqs
  has_many :actual_recipe_reqs

  validates :item_name, presence: true
end
