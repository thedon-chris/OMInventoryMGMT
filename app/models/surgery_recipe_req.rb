class SurgeryRecipeReq < ApplicationRecord
  belongs_to :supply_list
  belongs_to :surgery_type

  validates :qty, presence: true
  validates :supply_list_id, uniqueness: true

end
