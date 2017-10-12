class Inventory < ApplicationRecord
  belongs_to :clinic
  belongs_to :supply_list

  validates :qty, presence: true

  def out_of_stock
    if self.qty <= 0
      "ITEM OUT OF STOCK"
      # "ITEM OUT OF STOCK - #{self.supply_list.item_name}"
    end
  end

  def demand
    qty = 0
    item_number = self.supply_list_id
    self.clinic.surgery_appts.where(complete:false).each do |appt|
      appt.surgery_type.surgery_recipe_reqs.where(supply_list_id:item_number).each do |req|
        qty += req.qty
      end
    end
    qty
  end

  def actual_consumed
    qty = 0
    item_number = self.supply_list_id
    self.clinic.surgery_appts.where(complete:true).each do |appt|
      appt.actual_recipe_reqs.where(supply_list_id:item_number).each do |req|
        qty += req.qty
      end
    end
    qty
  end

  # one_week = time.state.from_now
  #
  # one_month = 1.month.from_now
  # one_year = 1.year.from_now

  def expiration(time, state)
    qty = 0
    x = "#{time}".to_i.send(:"#{state}").from_now
    item_number = self.supply_list_id
    self.clinic.surgery_appts.where(complete:false).where('surgery_date > ?', x).each do |appt|
      appt.surgery_type.surgery_recipe_reqs.where(supply_list_id:item_number).each do |req|
        qty += req.qty
      end
    end
    qty
  end


end






# def self.demand(_id, clinic)
#   inventory = Inventory.where(supply_list_id: _id, clinic: clinic)
#   return [] if inventory.empty?
#
#   # inventory.each do |item|
#   #   arr = []
#   #   stock = item.qty
#   #   item.
#
#   clinic.surgery_appts.each do |recipe|
#     # recipe.surgery_type.surgery_recipe_reqs.where(status: 'complete', supply_list_id: _id).where("surgery_date > ?", Time.now).each do |req|
#     recipe.surgery_type.surgery_recipe_reqs.where(supply_list_id: _id).each do |req|
#       arr << req.qty
#     end
#   end
#   arr = arr.sum
#   p "The demand for #{item.supply_list.item_name} is #{arr}"
# # end
# end



#
# #This will list the inventory demand, by item
# def self.demand(args)
#  Inventory.where(supply_list_id:args) do |item|
#    arr = []
#    stock = item.qty
#    item.clinic.surgery_appts.each do |recipe|
#      recipe.surgery_type.surgery_recipe_reqs.where(supply_list_id:args).each do |req|
#        arr << req.qty
#      end
#    end
#    arr = arr.sum
#    p "The demand for #{item.supply_list.item_name} is #{arr}"
#  end
# end
