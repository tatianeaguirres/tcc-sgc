json.extract! endereco, :id, :endereco, :numero, :complemento, :cidade, :estado, :cep, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
