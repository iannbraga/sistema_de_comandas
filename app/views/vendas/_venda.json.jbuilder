json.extract! venda, :id, :data, :hora, :cliente, :status, :created_at, :updated_at
json.url venda_url(venda, format: :json)
