class ProdutoVenda < ApplicationRecord
  belongs_to :produto
  belongs_to :venda
  
  def total
    produto.preco.to_f * self.quantidade.to_i
  end
end
