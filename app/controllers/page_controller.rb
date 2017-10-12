class PageController < ApplicationController
  def index
    @inventories = Inventory.all
    @surgery_appts = SurgeryAppt.all

  end

end
