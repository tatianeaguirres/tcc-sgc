class ProdutoOrcamento < ApplicationRecord
  belongs_to :produto
  belongs_to :orcamento
  
  def total
    produto.preco.to_f * self.quantidade.to_i
  end
end
