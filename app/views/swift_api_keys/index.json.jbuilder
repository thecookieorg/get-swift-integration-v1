json.array!(@swift_api_keys) do |swift_api_key|
  json.extract! swift_api_key, :id, :key
  json.url swift_api_key_url(swift_api_key, format: :json)
end
