class AddQuantidadeToProdutoOrcamentos < ActiveRecord::Migration[5.1]
  def change
    add_column :produto_orcamentos, :quantidade, :integer
  end
end
