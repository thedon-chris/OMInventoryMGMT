json.extract! surgery_recipe_req, :id, :qty, :supply_list_id, :surgery_type_id, :created_at, :updated_at
json.url surgery_recipe_req_url(surgery_recipe_req, format: :json)
