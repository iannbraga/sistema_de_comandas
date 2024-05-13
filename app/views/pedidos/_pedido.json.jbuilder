json.extract! pedido, :id, :comanda_id, :data, :hora, :observacoes, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
