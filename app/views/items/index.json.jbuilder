json.array!(@items) do |item|
  json.extract! item, :id, :quantity, :description, :price, :sku
  json.url item_url(item, format: :json)
end
