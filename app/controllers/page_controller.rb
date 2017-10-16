class PageController < ApplicationController
  skip_before_action :authorize, only: [:home]

  def index
    @inventories = Inventory.all
    @surgery_appts = SurgeryAppt.all
    @surgery_appt = SurgeryAppt.all
    @surgery_types = SurgeryType.all

    @inv_item_names = []
    @inventories.each do |inventory|
      @inv_item_names << inventory.supply_list.item_name
    end

    @inv_item_qts = []
    @inventories.each do |inventory|
      @inv_item_qts << inventory.qty
    end

    @surgery_types_names = []
    @surgery_types.each do |st|
      @surgery_types_names << st.surgery_name
    end

    @surgery_appts_count = []
    @surgery_types.each do |type|
      @surgery_appts_count << @surgery_appts.where(surgery_type_id:type).count
    end

  end


  def home
  end





end
