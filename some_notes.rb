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
