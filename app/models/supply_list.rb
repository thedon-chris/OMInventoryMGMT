class SupplyList < ApplicationRecord
  has_many :surgery_recipe_reqs
  has_many :actual_recipe_reqs
  has_many :inventories
<<<<<<< HEAD

=======
>>>>>>> 1d39cc7fbc5a7a650bb56df204cbad658f94c3c7
  validates :item_name, presence: true
end
