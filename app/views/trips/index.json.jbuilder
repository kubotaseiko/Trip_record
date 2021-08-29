json.array! @trips do |trip|
  json.id trip.id
  json.title trip.location
  json.start trip.starts_at
  json.end trip.ends_at
  json.url trip_url(trip, format: :html)
end
