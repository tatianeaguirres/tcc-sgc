json.extract! cliente, :id, :nome, :celular, :telefone, :email, :cpf, :endereco_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
