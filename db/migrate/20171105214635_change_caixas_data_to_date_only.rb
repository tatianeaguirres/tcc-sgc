class ChangeCaixasDataToDateOnly < ActiveRecord::Migration[5.1]
  def change
    change_column :caixas, :data, :date
  end
end
