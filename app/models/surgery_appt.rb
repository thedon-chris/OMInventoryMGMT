class SurgeryAppt < ApplicationRecord
  belongs_to :clinic
  belongs_to :surgery_type
  has_many :actual_recipe_reqs

  validates :surgery_date, presence: true

end
