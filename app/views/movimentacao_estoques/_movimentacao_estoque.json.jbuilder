json.extract! movimentacao_estoque, :id, :produto_id, :quantidade, :motivo, :observacao, :data, :hora, :created_at, :updated_at
json.url movimentacao_estoque_url(movimentacao_estoque, format: :json)
