class SupplyList < ApplicationRecord
  has_many :surgery_recipe_reqs
  has_many :actual_recipe_reqs
  has_many :inventories

  validates :item_name, presence: true
  validates :item_name, uniqueness: true


  def average_use
    i = 0
    this = self
      a = ActualRecipeReq.where(supply_list_id:this.id).map(&:qty)
      x = a.sum.to_f / a.count
      x.round(2)
  end





end
