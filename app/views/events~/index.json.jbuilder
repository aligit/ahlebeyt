json.array!(@events) do |event|
  json.extract! event, :id, :title, :body, :startdate, :enddate, :location
  json.url event_url(event, format: :json)
end
