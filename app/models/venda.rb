class Venda < ApplicationRecord
  belongs_to :cliente

  has_many :produto_vendas
  has_many :produtos, through: :produto_vendas

  accepts_nested_attributes_for :produtos, allow_destroy: true
  
  def calculate_total
    self.preco_total = 0.0
    
    produto_vendas.each do |produto_venda|
      self.preco_total += produto_venda.quantidade.to_i *  produto_venda.produto.preco.to_f
    end
    
    self.save
  end
end
