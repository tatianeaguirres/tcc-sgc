FactoryBot.define do
  
  factory :caixa do  
  end
  
  factory :cliente do
    endereco
  end
  
  factory :venda do
    cliente
  end
  
  factory :produto_venda do
  end
  
  factory :venda_caixa do  
    venda
    caixa
  end
  
  factory :fornecedor do
    endereco
  end
  
  factory :produto do
    fornecedor
    nome "Produto 1"
    preco 1.0
    
    factory :produto2 do
      nome "Produto 2"
      preco 2.0
    end
    
    factory :produto3 do
      nome "Produto 3"
      preco 3.0
    end
  end
  
  factory :endereco do
    endereco "Av. Paulista"
    sequence(:numero)
    complemento ""
    cidade "São Paulo"
    estado "SP"
    cep "01310-100"
  end
  
end