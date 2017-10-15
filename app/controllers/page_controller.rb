class PageController < ApplicationController
  skip_before_action :authorize, only: [:home]

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


  def home

  end





end
