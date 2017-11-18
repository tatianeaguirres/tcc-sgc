class Produto < ApplicationRecord
  belongs_to :fornecedor
  has_many :vendas, through: :produto_venda

  validates :nome, :preco, :presence => true

  attr_accessor :fornecedor_nome

  def nome_com_preco
    "#{self.nome}: #{ActionController::Base.helpers.number_to_currency(self.preco)}"
  end

end
