json.array!(@registers) do |register|
  json.extract! register, :id, :signup
  json.url register_url(register, format: :json)
end
