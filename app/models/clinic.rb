class Clinic < ApplicationRecord
  has_many :surgery_appts
  has_many :inventories

  validates :clinic_name, presence: true


  def demand(supply_list_item)
    qty = 0
    self.surgery_appts.each do |appt|
      appt.surgery_type.surgery_recipe_reqs.where(supply_list:supply_list_item).each do |recipe|
        qty += recipe.qty
      end
    end
    p "The demand for #{supply_list_item.item_name} at #{self.clinic_name} is #{qty}"
  end



end













# #Ed's Method for calculating demand
# def demand(supply_list_item)
#   qty = 0
#   # todo: only appointments that are not status == "complete"
#   self.surgery_appts.includes(:surgery_type).each do |appt|
#     appt.surgery_type.surgery_recipe_reqs.where(supply_list: supply_list_item).each do |req|
#       qty += req.qty
#     end
#   end
#   p "The demand for #{supply_list_item.item_name} at #{self.clinic_name} is #{qty}"
# end
