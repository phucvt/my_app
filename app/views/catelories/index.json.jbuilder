json.array!(@catelories) do |catelory|
  json.extract! catelory, :id, :name
  json.url catelory_url(catelory, format: :json)
end
