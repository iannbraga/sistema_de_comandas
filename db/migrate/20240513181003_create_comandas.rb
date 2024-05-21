class CreateComandas < ActiveRecord::Migration[7.0]
  def change
    create_table :comandas do |t|
      t.integer :numero
      t.string :nome, default: ""
      t.string :status, default: "Livre"
      t.decimal :total, default: 0

      t.timestamps
    end
  end
end
