class Endereco < ApplicationRecord

  validates :endereco, :cep, :cidade, :estado, :numero, presence: true

  def formatted
    formatted = "#{endereco}, #{numero}"
    formatted += ", #{complemento} " if complemento.present?
    formatted += " - #{cidade} / #{estado}"
    formatted
  end

end
