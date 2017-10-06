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


# #First, capture all of the supplies into a variable
# supplies = SupplyList.all
# #declare a "looping" variable i
# i = 1
# #first we want to l
# while i < supplies.count do
#   #create an empty array to store the qtys
#   arr = []
#   #we know that surgery appointments are a list of active record assocation objects, we want to loop through them
#   #create each loop onto appoitnments
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












end
