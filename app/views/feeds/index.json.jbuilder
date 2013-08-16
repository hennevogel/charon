json.array!(@feeds) do |feed|
  json.extract! feed, 
  json.url feed_url(feed, format: :json)
end
