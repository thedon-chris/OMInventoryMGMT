class Inventory < ApplicationRecord
  belongs_to :clinic
  belongs_to :supply_list

  validates :qty, presence: true

end
