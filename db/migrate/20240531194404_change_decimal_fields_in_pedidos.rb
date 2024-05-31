class ChangeDecimalFieldsInPedidos < ActiveRecord::Migration[7.0]
  def change
    change_column :pedidos, :total, :decimal, precision: 10, scale: 2, default: 0.00
  end
end
