Rails.application.routes.draw do
  get 'ajuda', to: 'ajuda#index'

  get 'search/cep'

  get 'reports/index'

  devise_for :users
  root to: "main#index"

  resources :vendas do
    collection do
      get :autocomplete_cliente_nome
      get :autocomplete_produto_nome
      post :delete_produto_venda
    end

    member do
      get :recibo
    end
  end
  resources :venda_caixas
  resources :produtos do
    get :autocomplete_fornecedor_nome, on: :collection
  end
  resources :produto_vendas
  resources :produto_orcamentos
  resources :orcamentos do
    collection do
      get :autocomplete_cliente_nome
      get :autocomplete_produto_nome
      post :delete_produto_orcamento
    end

    member do
      get :recibo
    end
  end
  resources :fornecedores
  resources :enderecos
  resources :caixas do
    post :close, on: :member
  end
  resources :clientes
  resources :relatorios, only: [:index, :show]
  resources :users
end
