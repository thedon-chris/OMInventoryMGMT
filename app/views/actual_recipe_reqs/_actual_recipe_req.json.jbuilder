json.extract! actual_recipe_req, :id, :qty, :surgery_appt_id, :supply_list_id, :created_at, :updated_at
json.url actual_recipe_req_url(actual_recipe_req, format: :json)
