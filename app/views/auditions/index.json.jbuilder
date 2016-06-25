json.array!(@auditions) do |audition|
  json.extract! audition, :id, :prosecutor, :courte, :turn, :date, :prosecutor_id, :month_id
  json.url audition_url(audition, format: :json)
end
