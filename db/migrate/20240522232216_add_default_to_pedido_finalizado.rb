class AddDefaultToPedidoFinalizado < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pedidos, :finalizado, false
  end
end
