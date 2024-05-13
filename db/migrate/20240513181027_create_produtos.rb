class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.decimal :preco
      t.integer :estoque
      t.string :categoria
      t.string :icone
      
      t.timestamps
    end
  end
end
