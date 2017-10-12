class PageController < ApplicationController
  def index
    @inventories = Inventory.all
  end

end
