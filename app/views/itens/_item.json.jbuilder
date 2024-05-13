json.extract! item, :id, :pedido_id, :produto_id, :quantidade, :preco_unitario, :subtotal, :observacoes, :created_at, :updated_at
json.url item_url(item, format: :json)
