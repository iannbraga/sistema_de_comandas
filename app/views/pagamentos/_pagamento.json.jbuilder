json.extract! pagamento, :id, :comanda_id, :metodo_pagamento, :valor_total_pago, :troco, :data, :hora, :created_at, :updated_at
json.url pagamento_url(pagamento, format: :json)
