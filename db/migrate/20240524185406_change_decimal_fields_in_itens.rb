class ChangeDecimalFieldsInItens < ActiveRecord::Migration[7.0]
  def change
    change_column :itens, :preco_unitario, :decimal, precision: 10, scale: 2, default: 0.0
    change_column :itens, :subtotal, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
