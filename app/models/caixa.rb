class Caixa < ApplicationRecord
  
  has_many :vendas, class_name: 'VendaCaixa'
  
  validates :data, presence: true
  validates :data, uniqueness: true
  
  def self.current
    Caixa.find_by(status: true)
  end
  
end
