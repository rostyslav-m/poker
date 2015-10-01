json.array!(@tables) do |table|
  json.extract! table, :id, :tabname, :time
  json.url table_url(table, format: :json)
end
