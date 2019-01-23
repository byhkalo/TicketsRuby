json.extract! event, :id, :artist, :description, :price_low, :price_hight, :event_date, :created_at, :updated_at
json.url event_url(event, format: :json)