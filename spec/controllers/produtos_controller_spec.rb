require 'rails_helper'

RSpec.describe ProdutosController, type: :controller do

  describe "busca de produtos" do
    it "deve retornar produtos pelo nome" do
      produto = create :produto
      produto_outro = create :produto, nome: "Outro"
      
      get :index, params: {query: "Outro"}
      
      expect(assigns(:produtos)).to eq([produto_outro])
    end
  end

end
