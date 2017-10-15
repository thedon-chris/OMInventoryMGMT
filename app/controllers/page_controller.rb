class PageController < ApplicationController
  def index
    @inventories = Inventory.all
    @surgery_appts = SurgeryAppt.all
    @surgery_appt = SurgeryAppt.all

    @inv_item_names = []
    @inventories.each do |inventory|
      @inv_item_names << inventory.supply_list.item_name
    end

    @inv_item_qts = []
    @inventories.each do |inventory|
      @inv_item_qts << inventory.qty
    end

  end



end
