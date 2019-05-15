json.extract! item, :id, :name, :start_time, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
