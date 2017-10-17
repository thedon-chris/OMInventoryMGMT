class SurgeryAppt < ApplicationRecord
  belongs_to :clinic
  belongs_to :surgery_type
  has_many :actual_recipe_reqs

  validates :surgery_date, presence: true


  after_create :sequence, :check_stock
  
  def sequence
    SurgeryType.find(self.surgery_type_id).surgery_recipe_reqs.each do |req|
      supply_item = req.supply_list_id
      ActualRecipeReq.create(
        qty:0,
        supply_list_id:supply_item,
        surgery_appt_id:self.id)
      end
  end

  def check_stock
    my_surgery_type = self.surgery_type
    all_inventories = Inventory.all
    arr = []
    arr2 = []
    my_surgery_type.surgery_recipe_reqs.each do |inv|
      this = inv.supply_list_id
      our_inv = all_inventories.where(supply_list_id:this).first
      state = our_inv.qty < our_inv.expiration(1, "week")
      arr << state
      if state == true
        arr2 << "#{inv.supply_list.item_name} is low on stock! "
      end
    end
    # arr
    arr2
  end
  # SurgeryAppt.first.check_stock




  def start_time
    self.surgery_date
  end

  def name
    self.surgery_type.surgery_name
  end


  def week_group
    SurgeryAppt.all.group_by_day(:surgery_date)
  end

  def appts
    @appts = SurgeryAppt.all
  end

  def complete_surgery(surgery_recipe_reqs_hsh)
    surgery_recipe_reqs_hsh.each do |supply_id, qty|
      item = self.actual_recipe_reqs.find_by(supply_list_id: supply_id)
      item.update(qty: qty)

      inventory = self.clinic.inventories.find_by(supply_list_id:supply_id)
      inventory_qty = inventory.qty
      new_qty = inventory_qty -= qty.to_i
      inventory.update(qty: new_qty)

    end
    self.update(complete: true)

  end

end


# final = []
# SurgeryAppt.includes(:surgery_type).where(surgery_date: "2017-10-06").each do |stype|
#   final << stype.surgery_recipe_reqs
#     .each do |ssr|
#       ssr.qty
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
#
#
#
#       .each do |ssr|
#            {
#             name: ssr.supply_list.item_name,
#             qty: ssr.qty,
#             id: ssr.supply_list_id
#           }
#       end
# end
#
# final.flatten
#
# .group(:supply_list_id)
#



 ############## HENRY ##############

#  final = []
#  SurgeryAppt.includes(:surgery_type).where(surgery_date: "2017-10-06").each do |stype|
#    final << stype.surgery_type.surgery_recipe_reqs.group(:supply_list_id)
#                  .map do |ssr|
#                    {
#                      :"#{ssr.supply_list_id}" => {
#                        name: ssr.supply_list.item_name,
#                        qty: ssr.qty,
#                        id: ssr.supply_list_id
#                      }
#                    }
#                  end
#  end
#
# final_hash = []
# final.flatten.each do |hash|
#   key = hash.keys.first.to_s
#   if final_hash.map{|d| d.keys.first.to_s }.flatten.include?(key)
#     final_hash.each do |fh|
#       if key == fh.keys.first.to_s
#         old_hash = fh[key.to_sym]
#         new_qty = hash[key.to_sym][:qty]
#         old_qty = old_hash[:qty]
#         ix = final_hash.index(fh)
#         clone_hash = hash
#         hash = clone_hash[key.to_sym][:qty] += old_qty
#         final_hash[ix] = clone_hash
#       end
#     end
#   else
#     final_hash << hash
#   end
# end


# def self.demand
#   # date =
#   final = []
#    SurgeryAppt.includes(:surgery_type).where(surgery_date: "2017-10-06").each do |stype|
#      final << stype.surgery_type.surgery_recipe_reqs.group(:supply_list_id)
#                    .map do |ssr|
#                      {
#                        :"#{ssr.supply_list_id}" => {
#                          name: ssr.supply_list.item_name,
#                          qty: ssr.qty,
#                          id: ssr.supply_list_id
#                        }
#                      }
#                    end
#    end
#
#   final_hash = []
#   final.flatten.each do |hash|
#     key = hash.keys.first.to_s
#     if final_hash.map{|d| d.keys.first.to_s }.flatten.include?(key)
#       final_hash.each do |fh|
#         if key == fh.keys.first.to_s
#           old_hash = fh[key.to_sym]
#           new_qty = hash[key.to_sym][:qty]
#           old_qty = old_hash[:qty]
#           ix = final_hash.index(fh)
#           clone_hash = hash
#           hash = clone_hash[key.to_sym][:qty] += old_qty
#           final_hash[ix] = clone_hash
#         end
#       end
#     else
#       final_hash << hash
#     end
#   end
#
# end






  #this is the logic we will use to confirm the match on supply_list_id of the individual items
  # Inventory.first.supply_list_id == SurgeryAppt.first.surgery_type.surgery_recipe_reqs.first.supply_list_id

  #
  # supplies = SupplyList.all
  # i = 1
  # while i < supplies.count do
  #  arr = []
  #  SurgeryAppt.all.each do |surgery|
  #    surgery.surgery_type.surgery_recipe_reqs.where(supply_list_id:i).each do |item|
  #      p arr << item.qty
  #    end
  #  end
  #  p "The total qty planned to use in Surgery Appointments of item #{SupplyList.find(i).item_name} is #{arr.sum}"
  #  i+=1
  # end


# myhash = Hash.new
# @appts = SurgeryAppt.all
# @appts.each do |recipe|
#   itemkey = nil
#   recipe.surgery_type.surgery_recipe_reqs.map do |item|
#     itemkey = item.supply_list_id
#     if myhash.has_key?(item)
#       qty = item.qty +500
#       myhash[item] = qty
#     else
#       myhash[item.supply_list_id] = item.qty
#     end
#   end
# end



# arr =[]
# arr2 = []
# SurgeryAppt.all.each do |recipe|
#   arr << recipe.surgery_type.surgery_recipe_reqs
#   arr.each do |x|
#     x.each do |qty|
#       arr2 << qty
#     end
#   end
# end

# final = []
#  SurgeryAppt.includes(:surgery_type).where(surgery_date: "2017-10-06").each do |stype|
#    final << stype.surgery_type.surgery_recipe_reqs.group(:supply_list_id)
#                  .map do |ssr|
#                    {
#                      ssr.supply_list_id => {
#                        name: ssr.supply_list.item_name,
#                        qty: ssr.qty,
#                        id: ssr.supply_list_id
#                      }
#                    }
#                  end
#  end
#
# final_hash = []
# final.flatten.each do |hash|
#   key = hash.keys.first.to_s
#   if final_hash.map{|d| d.keys.first.to_s }.flatten.include?(key)
#     final_hash.each do |fh|
#       if key == fh.keys.first.to_s
#         old_hash = fh[key.to_sym]
#         new_qty = hash[key.to_sym][:qty]
#         old_qty = old_hash[:qty]
#         ix = final_hash.index(fh)
#         clone_hash = hash
#         hash = clone_hash[key.to_sym][:qty] += old_qty
#         final_hash[ix] = clone_hash
#       end
#     end
#   else
#     final_hash << hash
#   end
# end



# myhash.update(myhash){ |k, va, vb| va + vb }


# final = []
# SurgeryAppt.includes(:surgery_type).where(surgery_date: "2017-10-06").each do |stype|
#   final << stype.surgery_type.surgery_recipe_reqs.group(:supply_list_id)
#                 .map do |ssr|
#                   {
#                     ssr.supply_list_id => {
#                       name: ssr.supply_list.item_name,
#                       qty: ssr.qty,
#                       id: ssr.supply_list_id
#                     }
#                   }
#                 end
# end
#
# final.flatten
