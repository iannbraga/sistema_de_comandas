class CreatePedidos < ActiveRecord::Migration[7.0]
  def change
    create_table :pedidos do |t|
      t.references :comanda, null: false, foreign_key: true
      t.date :data
      t.time :hora
      t.string :observacoes

      t.timestamps
    end
  end
end
