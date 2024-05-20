class AddRefVendaToItens < ActiveRecord::Migration[7.0]
  def change
    add_reference :itens, :venda, null: false, foreign_key: true
  end
end
