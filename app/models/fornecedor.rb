class Fornecedor < ApplicationRecord
  belongs_to :endereco
  accepts_nested_attributes_for :endereco

  validates :nome, :documento, :presence => true
end
