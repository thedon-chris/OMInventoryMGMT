class BusinessIntelligenceController < ApplicationController
  def index
    @inventories = Inventory.all
    @surgery_types = SurgeryType.all
    @surgery_appts = SurgeryAppt.all

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

    @projected_demand = []
    @inventories.each do |x|
      @projected_demand << x.expiration(1, 'week')
    end

    @actual_consump = []
    @inventories.each do |x|
      @actual_consump << x.actual_consumed
    end
  end

  def donut_graph
    @inventories = Inventory.all
    @surgery_types = SurgeryType.all
    @surgery_appts = SurgeryAppt.all

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

    @projected_demand = []
    @inventories.each do |x|
      @projected_demand << x.expiration(6, 'month')
    end

    @actual_consump = []
    @inventories.each do |x|
      @actual_consump << x.actual_consumed
    end
  end

  def line_graph
    @inventories = Inventory.all
    @surgery_types = SurgeryType.all
    @surgery_appts = SurgeryAppt.all

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

    @projected_demand = []
    @inventories.each do |x|
      @projected_demand << x.expiration(6, 'month')
    end

    @actual_consump = []
    @inventories.each do |x|
      @actual_consump << x.actual_consumed
    end
  end

  def bar_graph
    @inventories = Inventory.all
    @surgery_types = SurgeryType.all
    @surgery_appts = SurgeryAppt.all

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

    @projected_demand = []
    @inventories.each do |x|
      @projected_demand << x.expiration(6, 'month')
    end

    @actual_consump = []
    @inventories.each do |x|
      @actual_consump << x.actual_consumed
    end
  end

end



  # @inventories = Inventory.all
  # @surgery_types = SurgeryType.all
  # @surgery_appts = SurgeryAppt.all
  #
  # @inv_item_names = []
  # @inventories.each do |inventory|
  #   @inv_item_names << inventory.supply_list.item_name
  # end
  #
  # @inv_item_qts = []
  # @inventories.each do |inventory|
  #   @inv_item_qts << inventory.qty
  # end
  #
  # @surgery_types_names = []
  # @surgery_types.each do |st|
  #   @surgery_types_names << st.surgery_name
  # end
  #
  # @surgery_appts_count = []
  # @surgery_types.each do |type|
  #   @surgery_appts_count << @surgery_appts.where(surgery_type_id:type).count
  # end
  #
  # @projected_demand = []
  # @inventories.each do |x|
  #   @projected_demand << x.expiration(6, 'month')
  # end
  #
  # @actual_consump = []
  # @inventories.each do |x|
  #   @actual_consump << x.actual_consumed
  # end
