class AddDefaultToFinalizadoInPedidos < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pedidos, :finalizado, from: nil, to: false
    Pedido.where(finalizado: nil).update_all(finalizado: false)
  end
end
