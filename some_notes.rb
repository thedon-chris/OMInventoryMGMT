#Demand Function
Inventory.first.clinic.surgery_appts.where(status:true).first.surgery_type.surgery_recipe_reqs.where(supply_list_id:1)

def demand
  qty = 0
  item_number = self.supply_list_id
  self.clinic.surgery_appts.where(status:true).each do |appt|
    appt.surgery_type.surgery_recipe_reqs.where(supply_list_id:item_number).each do |req|
      qty += req.qty
    end
  end
end












































#THIS IS THE MODEL
class ProjectPage < ApplicationRecord
  def self.form_search(searches)
    searches = searches.where('amount > ?', params[:price_min]) if check_params(params[:price_min])
    @project_pages = ProjectPage.where(:project_id => searches.pluck(:'projects.id'))
  end
end


#THIS IS THE CONTROLLER
class ProjectPageController < ApplicationController
  def index
    @searches = Project.published.financed
    @project_pages = form_search(params)
  end
end

#when you want to call the function from the controller
#call like this ----------->
Project.form_search(arguments)
