json.extract! venda, :id, :data, :preco_total, :status, :cliente_id, :created_at, :updated_at
json.url venda_url(venda, format: :json)
