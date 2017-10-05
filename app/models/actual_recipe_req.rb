class ActualRecipeReq < ApplicationRecord
  belongs_to :surgery_appt
  belongs_to :supply_list

  validates :qty, presence: true

end
