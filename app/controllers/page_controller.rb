class PageController < ApplicationController
  def index
    @inventories = Inventory.all
    @surgery_appts = SurgeryAppt.all
    @surgery_appt = SurgeryAppt.all
  end



end
