class Clinic < ApplicationRecord
  has_many :surgery_appts
  has_many :inventories

  validates :clinic_name, presence: true

end
