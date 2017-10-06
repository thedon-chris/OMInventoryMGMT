class SurgeryAppt < ApplicationRecord
  belongs_to :clinic
  belongs_to :surgery_type
  has_many :actual_recipe_reqs

  validates :surgery_date, presence: true

  # def demand
  #   @appts = SurgeryAppt.all
  #   @appts.each do |list|
  #     list.surgery_type
  #   end
  # end

  def appts
    @appts = SurgeryAppt.all
  end


  # This gets the individual supply list items,
  #I am still not able to extract the qty's at this moment
  # SurgeryAppt.all.each do |surgery|
  # p surgery.surgery_type.surgery_recipe_reqs.where(supply_list_id:1)
  # end

  # This gets the individual supply list items and their quantity
  #this is only working for 1 item at a time
  #next step is to assign variable "i" to supply list id
  # arr = []
  # SurgeryAppt.all.each do |surgery|
  #   surgery.surgery_type.surgery_recipe_reqs.where(supply_list_id:1).each do |item|
  #     arr << item.qty
  #   end
  # end
  # p "The total of this item is #{arr.sum}"

# ----------------------------------
#Testing loop through all the supply items

# supplies = SupplyList.all
# i = 1
# while i < supplies.count do
#   arr = []
#   SurgeryAppt.all.each do |surgery|
#     surgery.surgery_type.surgery_recipe_reqs.where(supply_list_id:i).each do |item|
#       arr << item.qty
#     end
#   end
#   p "The total qty planned to use in Surgery Appointments of item #{supplies} is #{arr.sum}"
#   i+=1
# end










  #this is the logic we will use to confirm the match on supply_list_id of the individual items
  # Inventory.first.supply_list_id == SurgeryAppt.first.surgery_type.surgery_recipe_reqs.first.supply_list_id











  supplies = SupplyList.all
  i = 1
  while i < supplies.count do
   arr = []
   SurgeryAppt.all.each do |surgery|
     surgery.surgery_type.surgery_recipe_reqs.where(supply_list_id:i).each do |item|
       p arr << item.qty
     end
   end
   p "The total qty planned to use in Surgery Appointments of item #{SupplyList.find(i).item_name} is #{arr.sum}"
   i+=1
  end














end