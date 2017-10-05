class SurgeryType < ApplicationRecord
  has_many :surgery_appts
  has_many :surgery_recipe_reqs

  validates :surgery_name, presence: true

end
