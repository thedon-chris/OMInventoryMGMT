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

end

# final = []
# SurgeryAppt.includes(:surgery_type).where(surgery_date: "2017-10-06").each do |stype|
#   final << stype.surgery_recipe_reqs
#     .each do |ssr|
#       ssr.qty
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
