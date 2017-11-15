class AddPrecoTotalToOrcamentos < ActiveRecord::Migration[5.1]
  def change
    add_column :orcamentos, :preco_total, :decimal, precision: 6, scale: 2
  end
end
