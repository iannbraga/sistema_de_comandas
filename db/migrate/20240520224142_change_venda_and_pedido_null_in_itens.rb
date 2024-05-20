class ChangeVendaAndPedidoNullInItens < ActiveRecord::Migration[7.0]
  def change
    change_column_null :itens, :venda_id, true
    change_column_null :itens, :pedido_id, true
  end
end
