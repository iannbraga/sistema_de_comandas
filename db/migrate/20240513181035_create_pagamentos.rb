class CreatePagamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :pagamentos do |t|
      t.references :comanda, null: false, foreign_key: true
      t.string :metodo_pagamento
      t.decimal :valor_total_pago
      t.decimal :troco
      t.date :data
      t.time :hora

      t.timestamps
    end
  end
end
