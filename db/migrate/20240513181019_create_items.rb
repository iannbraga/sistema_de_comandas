class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade
      t.decimal :preco_unitario
      t.decimal :subtotal
      t.string :observacoes

      t.timestamps
    end
  end
end
