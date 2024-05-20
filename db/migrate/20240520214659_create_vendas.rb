class CreateVendas < ActiveRecord::Migration[7.0]
  def change
    create_table :vendas do |t|
      t.date :data
      t.time :hora
      t.string :cliente
      t.string :status
      t.decimal :total

      t.timestamps
    end
  end
end
