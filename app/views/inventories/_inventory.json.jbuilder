json.extract! inventory, :id, :qty, :clinic_id, :supply_list_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
