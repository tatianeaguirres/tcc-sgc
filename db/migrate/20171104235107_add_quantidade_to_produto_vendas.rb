class AddQuantidadeToProdutoVendas < ActiveRecord::Migration[5.1]
  def change
    add_column :produto_vendas, :quantidade, :integer
  end
end
