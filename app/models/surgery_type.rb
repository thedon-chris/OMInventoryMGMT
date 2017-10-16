class SurgeryType < ApplicationRecord
  has_many :surgery_appts
  has_many :surgery_recipe_reqs

  validates :surgery_name, presence: true

  def my_reqs
    self.surgery_recipe_reqs
  end






end
