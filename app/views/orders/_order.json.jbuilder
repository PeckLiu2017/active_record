json.extract! order, :id, :product, :created_at, :updated_at
json.url client_order_url(@client,order, format: :json)
