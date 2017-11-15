class VendaCaixa < ApplicationRecord
  belongs_to :venda
  belongs_to :caixa
end
