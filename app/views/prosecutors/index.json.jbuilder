json.array!(@prosecutors) do |prosecutor|
  json.extract! prosecutor, :id, :name
  json.url prosecutor_url(prosecutor, format: :json)
end
