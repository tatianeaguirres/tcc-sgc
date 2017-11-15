class Orcamento < ApplicationRecord
  belongs_to :cliente
  
  has_many :produto_orcamentos
  has_many :produtos, through: :produto_orcamentos

  accepts_nested_attributes_for :produtos, allow_destroy: true
  
  def calculate_total
    self.preco_total = 0.0
    
    produto_orcamentos.each do |produto_orcamento|
      self.preco_total += produto_orcamento.quantidade.to_i *  produto_orcamento.produto.preco.to_f
    end
    
    self.save
  end
end
