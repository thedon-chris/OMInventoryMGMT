class ActualRecipeReq < ApplicationRecord
  belongs_to :surgery_appt
  belongs_to :supply_list
  belongs_to :surgery_type

  validates :qty, presence: true

end
