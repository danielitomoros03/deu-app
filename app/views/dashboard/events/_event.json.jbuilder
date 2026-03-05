json.extract! event, :id, :title, :day, :created_at, :updated_at
json.url event_url(event, format: :json)
