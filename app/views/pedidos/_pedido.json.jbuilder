json.extract! pedido, :comanda_id, :data, :hora, :observacoes, :total, :finalizado, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
