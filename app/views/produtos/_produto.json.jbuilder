json.extract! produto, :id, :nome, :preco, :estoque, :categoria, :icone, :created_at, :updated_at
json.url produto_url(produto, format: :json)
