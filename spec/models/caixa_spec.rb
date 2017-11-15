require 'rails_helper'

RSpec.describe Caixa, type: :model do
  
  before do
    @caixa = create :caixa
    
    venda_caixa = create :venda_caixa, caixa: @caixa
    create :produto_venda, venda: venda_caixa.venda, produto: create(:produto)
    
    venda_caixa2 = create :venda_caixa
    create :produto_venda, venda: venda_caixa2.venda, produto: create(:produto2)
  end
  
  it "deve retornar vendas do dia" do
    expect(Venda.count).to eql 2
    expect(@caixa.vendas.count).to eql 1
  end
  
end
