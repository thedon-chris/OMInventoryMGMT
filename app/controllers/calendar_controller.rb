class CalendarController < ApplicationController
  def index
    @surgery_appt = SurgeryAppt.all
  end

  def week
    @surgery_appt = SurgeryAppt.all
  end

  def test
  end
  
end
